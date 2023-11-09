import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_image_picker_universal/src/image_source_dialog.dart';

class ImageSourcePicker extends StatefulWidget {
  final Uint8List? value;
  final Function(Uint8List?) onChanged;
  const ImageSourcePicker({super.key, required this.onChanged, this.value});

  @override
  State<ImageSourcePicker> createState() => _ImageSourcePickerState();
}

class _ImageSourcePickerState extends State<ImageSourcePicker> {
  final ImagePicker picker = ImagePicker();

  dynamic type;
  XFile? pickedImage;
  Uint8List? img;
  Future<Uint8List?> pick() async {
    return null;
  }

  @override
  void initState() {
    img = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const imageSize = 80.0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () async {
              type = await showModalBottomSheet<dynamic>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return ImageSourceDialog(
                      showRemoveImage: img != null,
                    );
                  });
              if (type == ImageSource.gallery || type == ImageSource.camera) {
                pickedImage = await picker.pickImage(source: type);
                if (pickedImage != null) {
                  img = await pickedImage?.readAsBytes();
                  widget.onChanged(img);
                  setState(() {});
                }
              } else if (type == false) {
                pickedImage = null;
                img = null;
                widget.onChanged(img);
                setState(() {});
              }
            },
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey,
                    width: imageSize,
                    height: imageSize,
                    child: const Center(
                      child: Icon(Icons.upload_rounded),
                    ),
                  ),
                  if (img != null)
                    Container(
                      color: Colors.grey,
                      child: Image.memory(
                        img ?? Uint8List(0),
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
