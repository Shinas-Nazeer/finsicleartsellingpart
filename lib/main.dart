import 'package:addphotofirebase/art_images/art_images_array.dart';
import 'package:addphotofirebase/art_posting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => ArtImageGallery(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
    
          primarySwatch: Colors.blue,
        ),
        home:ArtPostingPage() 
      ),
    );
  }
}

