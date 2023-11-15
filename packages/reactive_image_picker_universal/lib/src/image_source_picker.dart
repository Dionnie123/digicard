import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_image_picker_universal/src/image_source_dialog.dart';

import 'image_cache_downloader.dart';

class ImageSourcePicker extends StatefulWidget {
  final String? imageUrl;
  final Uint8List? value;
  final Function(Uint8List?) onChanged;
  final Function(Uint8List?) onImageFetched;
  const ImageSourcePicker(
      {super.key,
      required this.onChanged,
      this.value,
      this.imageUrl,
      required this.onImageFetched});

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
  void dispose() {
    pickedImage = null;
    img = null;
    super.dispose();
  }

  @override
  void initState() {
    () async {
      img = widget.value;
      img ??= await imageCacheDownload(widget.imageUrl.toString());
      setState(() {
        //  widget.onChanged(img);
      });
    }();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const imageSize = 80.0;

    return Column(
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
    );
  }
}
