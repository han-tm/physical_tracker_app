// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// enum PhoneAuthStatus {
//   initial,
//   loading,
//   codeSent,
//   resendOTPSuccess,
//   success,
//   successRedirect,
//   failure,
// }

// class PhoneAuthState {
//   final PhoneAuthStatus status;
//   final String? code;
//   final String? errorMessage;

//   PhoneAuthState({
//     required this.status,
//     this.code,
//     this.errorMessage,
//   });
// }

// class PhoneAuthProvider extends ChangeNotifier {
//   final FirebaseAuth _auth;
//   final FirebaseFirestore _fs;
//   final FirebaseFunctions _ff;

//   PhoneAuthState _state = PhoneAuthState(status: PhoneAuthStatus.initial);
//   PhoneAuthState get state => _state;

//   PhoneAuthProvider()
//       : _auth = FirebaseAuth.instance,
//         _fs = FirebaseFirestore.instance,
//         _ff = FirebaseFunctions.instance;

//   void _setState(PhoneAuthState newState) {
//     _state = newState;
//     notifyListeners();
//   }

//   Future<void> sendCode(String phone, {bool isResend = false}) async {
//     print('send code phone: $phone');
//     _setState(PhoneAuthState(status: PhoneAuthStatus.loading));
//     try {
//       final HttpsCallable callable = _ff.httpsCallable('sendCodeDev', options: HttpsCallableOptions());
//       final Map<String, dynamic> dataToSend = {'phone': phone};
//       print('Data being sent to Firebase Function: $dataToSend');
//       final HttpsCallableResult result = await callable.call(dataToSend);
//       print('Result: ${result.data}');
//       final code = result.data['code'];
//       if (isResend) {
//         _setState(PhoneAuthState(status: PhoneAuthStatus.resendOTPSuccess, code: code));
//       } else {
//         _setState(PhoneAuthState(status: PhoneAuthStatus.codeSent, code: code));
//       }
//     } on FirebaseFunctionsException catch (e) {
//       print('Firebase Functions Error: ${e.code} - ${e.message} - ${e.details}');
//       String message = e.message == 'Failed to send code due to an internal server error.'
//           ? 'Произошла ошибка при отправке кода'
//           : e.message == 'Wait before requesting another code.'
//               ? 'Подождите, прежде чем запрашивать другой код'
//               : e.message ?? e.code;
//       _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: message));
//     } catch (e) {
//       print('Error {sendCode}: $e');
//       _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: e.toString()));
//     }
//   }

//   Future<void> verifyOTP(String phone, String otp) async {
//     _setState(PhoneAuthState(status: PhoneAuthStatus.loading));
//     try {
//       final HttpsCallable callable = _ff.httpsCallable('verifyCode', options: HttpsCallableOptions());
//       final Map<String, dynamic> dataToSend = {'phone': phone, 'code': otp};
//       print('Data being sent to Firebase Function: $dataToSend');
//       final HttpsCallableResult result = await callable.call(dataToSend);
//       print('Result: ${result.data}');

//       final String? token = result.data['token'];

//       if (token == null) {
//         _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: 'Token not found'));
//         return;
//       }

//       await _signInWithCredential(token, phone);
//     } on FirebaseFunctionsException catch (e) {
//       print('Firebase Functions Error: ${e.code} - ${e.message} - ${e.details}');
//       String message = e.message == 'Invalid code provided.' ? 'Код неверный' : e.message ?? e.code;
//       _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: message));
//     } catch (e) {
//       print('Error {verifyOTP}: $e');
//       _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: e.toString()));
//     }
//   }

//   Future<void> _signInWithCredential(String customToken, String phone) async {
//     try {
//       final UserCredential userCredential = await _auth.signInWithCustomToken(customToken);

//       if (userCredential.user != null) {
//         final userCollection = _fs.collection('users');
//         final userData = await userCollection.doc(userCredential.user!.uid).get();

//         if (userData.exists) {
//           final userModel = UserModel.fromFirestore(userData);
//           if (userModel.banned) {
//             _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: 'userBanned'.tr()));
//             return;
//           } else if (!userModel.profileFilled) {
//             _setState(PhoneAuthState(status: PhoneAuthStatus.successRedirect));
//             return;
//           } else {
//             _setState(PhoneAuthState(status: PhoneAuthStatus.success, type: (userModel.userType ?? UserType.kid).name));
//             _userProvider.setUser(userModel);
//             return;
//           }
//         } else {
//           print('Create new User');
//           await _createNewUser(userCredential.user!, phone);
//           _setState(PhoneAuthState(status: PhoneAuthStatus.successRedirect));
//         }
//       } else {
//         _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: 'errorSigningIn'.tr()));
//       }
//     } on FirebaseAuthException catch (e) {
//       _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: e.code));
//     } catch (e) {
//       _setState(PhoneAuthState(status: PhoneAuthStatus.failure, errorMessage: e.toString()));
//     }
//   }

//   Future<void> _createNewUser(User user, String phone) async {
//     final userCollection = _fs.collection('users');
//     Map<String, dynamic> userData = {
//       'name': user.displayName ?? 'undefined'.tr(),
//       'phone': '+$phone',
//       'email': user.email,
//       'type': null,
//       'profile_filled': false,
//       'banned': false,
//       'deleted': false,
//       'notification': true,
//       'game_points': 0,
//       'points': 0,
//       'created_at': FieldValue.serverTimestamp(),
//     };
//     await userCollection.doc(user.uid).set(userData);
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//     _setState(PhoneAuthState(status: PhoneAuthStatus.initial));
//   }
// }
