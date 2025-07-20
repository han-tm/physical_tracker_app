// import 'dart:convert';
// import 'dart:typed_data' show Uint8List;
//
// class FFUploadedFile {
//   const FFUploadedFile({
//     this.name,
//     this.bytes,
//     this.height,
//     this.width,
//     this.blurHash,
//   });
//
//   final String? name;
//   final Uint8List? bytes;
//   final double? height;
//   final double? width;
//   final String? blurHash;
//
//   @override
//   String toString() =>
//       'FFUploadedFile(name: $name, bytes: ${bytes?.length ?? 0}, height: $height, width: $width, blurHash: $blurHash,)';
//
//   String serialize() => jsonEncode(
//         {
//           'name': name,
//           'bytes': bytes,
//           'height': height,
//           'width': width,
//           'blurHash': blurHash,
//         },
//       );
//
//   static FFUploadedFile deserialize(String val) {
//     final serializedData = jsonDecode(val) as Map<String, dynamic>;
//     final data = {
//       'name': serializedData['name'] ?? '',
//       'bytes': serializedData['bytes'] ?? Uint8List.fromList([]),
//       'height': serializedData['height'],
//       'width': serializedData['width'],
//       'blurHash': serializedData['blurHash'],
//     };
//     return FFUploadedFile(
//       name: data['name'] as String,
//       bytes: Uint8List.fromList(data['bytes'].cast<int>().toList()),
//       height: data['height'] as double?,
//       width: data['width'] as double?,
//       blurHash: data['blurHash'] as String?,
//     );
//   }
//
//   @override
//   int get hashCode => Object.hash(
//         name,
//         bytes,
//         height,
//         width,
//         blurHash,
//       );
//
//   @override
//   bool operator ==(other) =>
//       other is FFUploadedFile &&
//       name == other.name &&
//       bytes == other.bytes &&
//       height == other.height &&
//       width == other.width &&
//       blurHash == other.blurHash;
// }
import 'dart:convert';
import 'dart:typed_data' show Uint8List;

class FFUploadedFile {
  const FFUploadedFile({
    this.name,
    this.bytes,
    this.url,
    this.height,
    this.width,
    this.blurHash,
  });

  final String? name;
  final Uint8List? bytes;
  final String? url; // ← добавлено
  final double? height;
  final double? width;
  final String? blurHash;

  @override
  String toString() => 'FFUploadedFile(name: $name, '
      'bytes: ${bytes?.length ?? 0}, '
      'url: $url, '
      'height: $height, '
      'width: $width, '
      'blurHash: $blurHash)';

  String serialize() => jsonEncode({
    'name': name,
    'bytes': bytes != null ? bytes!.toList() : null,
    'url': url,
    'height': height,
    'width': width,
    'blurHash': blurHash,
  });

  static FFUploadedFile deserialize(String val) {
    final data = jsonDecode(val) as Map<String, dynamic>;
    return FFUploadedFile(
      name: data['name'] as String?,
      bytes: data['bytes'] != null
          ? Uint8List.fromList(List<int>.from(data['bytes']))
          : null,
      url: data['url'] as String?,
      height: data['height'] as double?,
      width: data['width'] as double?,
      blurHash: data['blurHash'] as String?,
    );
  }

  @override
  int get hashCode => Object.hash(name, bytes, url, height, width, blurHash);

  @override
  bool operator ==(Object other) =>
      other is FFUploadedFile &&
          other.name == name &&
          _listEquals(other.bytes, bytes) &&
          other.url == url &&
          other.height == height &&
          other.width == width &&
          other.blurHash == blurHash;

  bool _listEquals(List<int>? a, List<int>? b) {
    if (a == null || b == null) return a == b;
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; ++i) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
