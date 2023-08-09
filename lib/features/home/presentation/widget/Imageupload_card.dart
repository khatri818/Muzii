import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageUploadCard extends StatefulWidget {
  @override
  _ImageUploadCardState createState() => _ImageUploadCardState();
}

class _ImageUploadCardState extends State<ImageUploadCard> {
  String? _filePath; // Change to nullable type

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          if (_filePath != null)
            Image.file(
              File(_filePath!),
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
