import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:hl_image_picker/hl_image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'package:pos_app/core/ui/toaster.dart';
import 'package:pos_app/core/utils/extensions/context_extensions.dart';

class MediaHelper {
  static downloadImage(String url,
      {File? imageFile,
      http.Response? response1,
      String? outputMimeType}) async {
    String? message;
    final File file;
    try {
      if (response1 != null) {
        // Get temporary directory
        final dir = await getTemporaryDirectory();

        // Get the image name
        final imageName = url.split('/').last;

        // Create an image name
        var filename = '${dir.path}/$imageName';

        // Save to filesystem
        file = File(filename);
        if (!file.existsSync()) {
          await file.writeAsBytes(response1.bodyBytes);
        }
      } else {
        file = imageFile!;
      }
      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'downloaded successfully';
      }
    } catch (e) {
      message = 'An error occurred while saving the image';
    }

    if (message != null) {
      Toaster.showToast(message);
    }
  }

  static Future<File?> openCamera() async {
    final picker = HLImagePicker();
    List<HLPickerItem> selectedImages = [];

    try {
      final image = await picker.openPicker(
        cropping: true,

        pickerOptions: const HLPickerOptions(
          mediaType: MediaType.image,
          enablePreview: true,
          // isExportThumbnail: _isExportThumbnail,
          thumbnailCompressFormat: CompressFormat.jpg,
          thumbnailCompressQuality: 0.9,
          maxSelectedAssets: 1,
          usedCameraButton: true,
          numberOfColumn: 4,
          isGif: true,
        ),
        // ),
      );

      File tempFile = File(image[0].path);

      if (await tempFile.exists()) {
        return tempFile;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<List<AssetEntity>?> myMultiAssetPicker(BuildContext context) {
    AssetPickerTextDelegate textDelegate =
        const EnglishAssetPickerTextDelegate();

    return AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        maxAssets: 1,
        textDelegate: textDelegate,
        requestType: RequestType.image,
        themeColor: const Color(0xff137AC9),
        specialItemPosition: SpecialItemPosition.prepend,
        specialItemBuilder: (
          BuildContext context,
          AssetPathEntity? path,
          int length,
        ) {
          // if (path?.isAll != true) {
          //   return null;
          // }
          return Semantics(
            label: textDelegate.sActionUseCameraHint,
            button: true,
            onTapHint: textDelegate.sActionUseCameraHint,
            child: InkWell(
                onTap: () async => await CameraPicker.pickFromCamera(
                      context,
                      pickerConfig: const CameraPickerConfig(
                        textDelegate: EnglishCameraPickerTextDelegate(),
                        enableAudio: false,
                      ),
                    ),
                child: Container(
                  color: context.exBackground,
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.camera_alt,
                    color: context.exOnPrimaryContainer,
                  ),
                )),
          );
        },
      ),
    );
  }
}
