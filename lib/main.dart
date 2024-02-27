import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.camera, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (img == null) return;
    setState(() {
      _image = File(img.path); // convert it to a Dart:io file
    });
    // try {
    //   final XFile = await picker.pickImage(source: ImageSource.camera);
    //   setState(() {
    //     _image = File(XFile!.path);
    //   });
    // } catch (e) {
    //   print("No image was picked");
    // }
    // String base64Image = base64Encode(_image!.readAsBytesSync());

    // var url = 'http://10.26.16.142:5000/';
    // final response = await http.post(
    //   url as Uri,
    //   body: jsonEncode(
    //     {
    //       'image': base64Image,
    //     },
    //   ),
    //   headers: {'Content-Type': "application/json"},
    // );
    // print('StatusCode : ${response.statusCode}');
    // print('Return Data : ${response.body}');

    // setState(() {
    //   _image = _image;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        // ignore: unnecessary_null_comparison
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
