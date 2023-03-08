import 'package:addphotofirebase/constants.dart';
import 'package:addphotofirebase/posting_textform.dart';
import 'package:addphotofirebase/validate.dart';
import 'package:flutter/material.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';
import 'package:provider/provider.dart';

import 'art_images/art_images_array.dart';
import 'button.dart';
import 'imagepicker.dart';

class ArtPostingPage extends StatelessWidget {
  ArtPostingPage({super.key});

  final TextEditingController _artNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) { 
    // var provider = Provider.of<ArtImageGallery>(context);       
    return Consumer<ArtImageGallery>(
      builder: (context, value, child) =>
      Scaffold(
        appBar: AppBar(), 
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [ 
                PostingTextform(
                  headLineText: 'Art Name',
                  textController: _artNameController,
                  hintText: 'Art Name',
                  validator: (value) => validatefields(value),
                ),
                // InkWell(
                //   onTap: () {
                //     showDialog(
                //         context: context,
                //         builder: (BuildContext context) =>
                //             const ImagePickerWidget());
                //   },
                //   child: PostingTextform(
                //     enabled: false,
                //     hintText: 'Choose Photos from Gallery',
                //     textController: _galleryController,
                //     headLineText: 'Add Photos',
                //     validator: (value) => validatefields(value),
                //   ),
                // ),
    
                PostingTextform(
                  maxLines: 7,
                  headLineText: "Add Description",
                  textController: _descriptionController,
                  hintText: "Add Description",
                  validator: (value) => validatefields(value),
                ),
                PostingTextform(
                  headLineText: "Enter Price of the Art",
                  hintText: "Enter Price of the Art",
                  textController: _priceController,
                  validator: (value) => validatefields(value),
                ),
                if (value.imageProviders.isNotEmpty)  
                  GalleryImageView(
                    listImage: value.imageProviders,
                    width: 200,
                    height: 200,
                    imageDecoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Mybutton(
                    label: 'Upload Images',
                    ontap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const ImagePickerWidget());
                    },
                    buttonColor: kPrimaryTextcolor,    
                  ),
                ),
    
                const SizedBox(
                  height: 8,
                ),
                Mybutton(label: 'Post Now', ontap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  // firebasepost() async {
  //                 User? user = FirebaseAuth.instance.currentUser;
  //                 final adminUid = user!.uid;
  //                 if (_formKey.currentState!.validate()) {
  //                   try {
  //                     await FirebaseFirestore.instance
  //                         .collection('art')
  //                         .doc()
  //                         .set(({
  //                           'ArtName': _artNameController.text,
  //                           'ArtDescription': _artNameController.text,
  //                           'ArtPrice': _priceController.text,
  //                           'ArtAdmin': adminUid,
  //                         }));
  //                   } catch (e) {
  //                     print(e);
  //                   }
  //                 } else {
  //                   print("NOt ok");
  //                 }
  //               }
}
