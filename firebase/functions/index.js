const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();
const collection = "phone_verifications";
const axios = require("axios");

function generateCode() {
  return Math.floor(100000 + Math.random() * 900000).toString();
}

async function canRequestCode(phone) {
  const doc = await db.collection(collection).doc(phone).get();
  if (!doc.exists) return true;
  const lastSent = doc.data().createdAt?.toDate?.() || new Date(0);
  return (Date.now() - lastSent.getTime()) > 60 * 1000;
}

async function storeCode(phone, code) {
  return db.collection(collection).doc(phone).set({
    code,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    attempts: 0
  });
}

async function validateCode(phone, inputCode) {
  const ref = db.collection(collection).doc(phone);
  const snap = await ref.get();
  if (!snap.exists) return "invalid";

  const data = snap.data();
  if ((data.attempts || 0) >= 4) return "blocked";

  if (data.code !== inputCode) {
    await ref.update({ attempts: admin.firestore.FieldValue.increment(1) });
    return "invalid";
  }

  return "valid";
}

async function cleanupCode(phone) {
  return db.collection(collection).doc(phone).delete();
}

// 🔧 DEV: возвращает код в ответе
exports.sendCodeDev = functions.https.onCall(async (data, context) => {

  const payload = data.data ? data.data : data;
  console.log('Received data in sendCodeDev (onCall):', payload);
  const phone = payload?.phone?.toString();
  if (!phone) {
    console.error('Missing phone number in request data.');
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Phone is required.'
    );
  }

  if (!(await canRequestCode(phone))) {
    console.warn(`Too many requests for phone: ${phone}`);
    throw new functions.https.HttpsError(
      'resource-exhausted',
      'Wait before requesting another code.'
    );
  }
  const code = generateCode();

  try {

    await axios.post("https://cp.redsms.ru/api/message", {
      route: "sms",
      from: "YBoom",
      to: phone,
      text: `Ваш код ${code}`,
      test: true
    }, {
      headers: {
        "ts": "ygodboom",
        "secret": "d6874856134f8e82755355ebd2ed631e",
        "login": "ygodboom"
      }
    });

    await storeCode(phone, code);
    return { success: true, code: code };
  } catch (error) {

    console.error('Error sending code or storing it:', error);

    throw new functions.https.HttpsError(
      'internal',
      'Failed to send code due to an internal server error.',
      error.message
    );
  }
});

// 🚀 PROD: не возвращает код
exports.sendCodeProd = functions.https.onCall(async (data, context) => {


  const payload = data.data ? data.data : data;
  console.log('Received data in sendCodeProd (onCall):', payload);
  const phone = payload?.phone?.toString();
  if (!phone) {
    console.error('Missing phone number in request data.');
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Phone is required.'
    );
  }

  if (!(await canRequestCode(phone))) {
    console.warn(`Too many requests for phone: ${phone}`);
    throw new functions.https.HttpsError(
      'resource-exhausted',
      'Wait before requesting another code.'
    );
  }
  const code = generateCode();

  try {

    await axios.post("https://cp.redsms.ru/api/message", {
      route: "sms",
      from: "YBoom",
      to: phone,
      text: `Ваш код ${code}`,
      test: false
    }, {
      headers: {
        "ts": "ygodboom",
        "secret": "d6874856134f8e82755355ebd2ed631e",
        "login": "ygodboom"
      }
    });

    await storeCode(phone, code);
    return { success: true };
  } catch (error) {

    console.error('Error sending code or storing it:', error);

    throw new functions.https.HttpsError(
      'internal',
      'Failed to send code due to an internal server error.',
      error.message
    );
  }
});

// ✅ Проверка кода + авторизация
exports.verifyCode = functions.https.onCall(async (data, context) => {


  const payload = data.data ? data.data : data;
  console.log('Received data in verifyCode (onCall):', payload);
  const phone = payload?.phone?.toString();
  const code = payload?.code?.toString();


  if (!phone || !code) {
    console.error('Missing phone or code in request data.');
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Phone and code are required.'
    );
  }

  const result = await validateCode(phone, code);

  if (result === "blocked") {
    console.warn(`Too many attempts for phone: ${phone}`);
    throw new functions.https.HttpsError(
      'resource-exhausted',
      'Too many attempts. Please try again later.'
    );
  }

  if (result === "invalid") {
    console.warn(`Invalid code provided for phone: ${phone}`);
    throw new functions.https.HttpsError(
      'unauthenticated',
      'Invalid code provided.'
    );
  }


  const uid = `phone_${phone}`;
  let token;
  try {
    token = await admin.auth().createCustomToken(uid);
    console.log(`Custom token created for UID: ${uid}`);
  } catch (error) {
    console.error(`Error creating custom token for UID ${uid}:`, error);
    throw new functions.https.HttpsError(
      'internal',
      'Failed to create authentication token.',
      error.message
    );
  }


  try {
    await cleanupCode(phone);
    console.log(`Code cleaned up for phone: ${phone}`);
  } catch (error) {
    console.error(`Error cleaning up code for phone ${phone}:`, error);

  }

  return { token: token };
});
