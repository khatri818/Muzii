// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';

// class ImageUploadCard extends StatefulWidget {
//   @override
//   _ImageUploadCardState createState() => _ImageUploadCardState();
// }

// class _ImageUploadCardState extends State<ImageUploadCard> {
//   String? _filePath; // Change to nullable type

//   Future<void> _pickImage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//     );

//     if (result != null) {
//       setState(() {
//         _filePath = result.files.single.path!;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: [
//           if (_filePath != null)
//             Image.file(
//               File(_filePath!),
//               width: 150,
//               height: 150,
//               fit: BoxFit.cover,
//             ),
//           ElevatedButton(
//             onPressed: _pickImage,
//             child: Text('Upload Image'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCard extends StatefulWidget {
  const ImagePickerCard({super.key});

  @override
  State<ImagePickerCard> createState() => _ImagePickerCardState();
}

class _ImagePickerCardState extends State<ImagePickerCard> {
  late ImagePicker _imagePicker;
  late PickedFile _pickedImage;
  bool _hasImage = false;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    // final XFile? pickedImage =
    //     await _imagePicker.pickImage(source: ImageSource.gallery);

    PickedFile pickedImage = await (_imagePicker.pickImage(
        source: ImageSource.gallery)) as PickedFile;
    setState(() {
      _pickedImage = pickedImage;
      _hasImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Card'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _hasImage
                ? Card(
                    child: Column(
                      children: [
                        Image.file(File(_pickedImage.path)),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Picked Image'),
                        ),
                      ],
                    ),
                  )
                : const Card(
                    child: Text('No Image Selected'),
                  ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
