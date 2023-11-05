import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUniversal {
  final BuildContext context;
  final ImageSource type;
  final bool crop;

  ImagePickerUniversal(this.context, {required this.type, this.crop = true});
  final ImagePicker _logoPicker = ImagePicker();
  final _controller = CropController();
  Future<Uint8List?> pick() async {
    final XFile? pickedImage = (await _logoPicker.pickImage(source: type));
    final x = await pickedImage?.readAsBytes();
    if (crop) {
      return await _cropImage(pickedImage?.path);
    }
    return x;
  }

  Future<Uint8List?> cropper(Uint8List? imageData) async {
    Uint8List? x;

    if (imageData != null) {
      print("DDDDXXX");
      try {
        Crop(
            image: imageData,
            controller: _controller,
            onCropped: (image) {
              x = image;
            });
      } catch (e) {
        print(e.toString());
      }

      return null;
    }

    return x;
  }

  Future<Uint8List?> _cropImage(String? src) async {
    return await ImageCropper().cropImage(
      sourcePath: src ?? '',
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.page,
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    ).then((croppedFile) async {
      return await croppedFile?.readAsBytes();
    });
  }
}
