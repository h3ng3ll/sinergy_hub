import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class ImageService {
   Future<Uint8List> compressToTargetSize(Uint8List input, {
    int targetSizeKB = 200,
  }) async {
    int quality = 90;
    Uint8List result = input;

    do {
      result = Uint8List.fromList(
        await FlutterImageCompress.compressWithList(
          input,
          quality: quality,
          format: CompressFormat.jpeg,
        ),
      );

      quality -= 10;
    } while (result.lengthInBytes > targetSizeKB * 1024 && quality > 10);

    return result;
  }
}
