import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(      
      appBar: AppBar(
                title: Text("Tirar foto"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.save), 
                    onPressed: (){
                      if(_image != null){

                      }
                    })
                ],
      ),
      body: Column(        
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 300.0,
            child: Center(
              child: _image == null
                  ? Text('Sem foto.')
                  : Image.file(_image),
            ),
          )
        ],
      ),      
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Tirar foto',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}