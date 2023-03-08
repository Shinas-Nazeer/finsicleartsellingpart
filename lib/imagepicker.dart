import 'dart:io';
import 'package:addphotofirebase/button.dart';
import 'package:addphotofirebase/constants.dart';
import 'package:flutter/material.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'art_images/art_images_array.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

File? _image;
// bool _uploading = false;
final picker = ImagePicker();

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ArtImageGallery>(context);

    addImagetoList() {
      setState(() {
        provider.imageProviders.add(Image.file(_image!).image);
        _image = null;
      });
    }

    return Dialog(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            elevation: 1,
            title: const Text("Upload Images"),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: FittedBox(
                          child: _image == null
                              ? const Icon(
                                  Icons.photo_library_sharp,
                                  color: Colors.grey,
                                )
                              : Image.file(_image!)),
                    ),
                  ],
                ),
              ),
              if (_image != null)
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CoustomElevatedButoon(
                            label: "Save",
                            ontap: addImagetoList,
                            backGroundColor: Colors.green),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CoustomElevatedButoon(
                            label: "Cancel",
                            ontap: () {
                              setState(() {
                                _image = null;
                              });
                            },
                            backGroundColor: Colors.red),
                      ),
                    )
                  ],
                ),
              if (provider.imageProviders.isNotEmpty)
                GalleryImageView(
                  listImage: provider.imageProviders,
                  width: 200,
                  height: 200,
                  imageDecoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                ),
              CoustomElevatedButoon(
                  label: provider.imageProviders.isNotEmpty ? 'Upload More Images' : 'Upload Images',
                  ontap: () {
                    getImage();
                  },
                  backGroundColor: kPrimaryTextcolor)
            ],
          )
        ],
      ),
    );
  }
}
