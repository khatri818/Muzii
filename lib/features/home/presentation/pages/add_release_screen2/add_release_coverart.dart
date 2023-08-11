import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/commonButton.dart';
import 'package:flutter_application_1/common/style.dart';
import 'package:flutter_application_1/constant/image_resource.dart';
import 'package:flutter_application_1/features/home/presentation/pages/review_song.dart';

class CoverArtPage extends StatefulWidget {
  const CoverArtPage({super.key});

  @override
  State<CoverArtPage> createState() => _CoverArtPageState();
}

class _CoverArtPageState extends State<CoverArtPage> {
  File? image;
  File? audio;
  String preview = 'Preview';

  String buttonName = 'Next Step';

  void _changeButtonName() {
    setState(() {
      if (buttonName == 'Next Step') {
        buttonName = 'Review Your Song';
      } else {
        buttonName = 'Next Step';
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ReviewYourSong()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Add Release - Step 3/3',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles.sizedBoxH10,
            const Text(
              'Cover Art',
              style: TextStyle(
                color: Color(0xFF1F1C1C),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Styles.sizedBoxH10,
            image == null
                ? Center(
                    child: SizedBox(
                      width: 330,
                      height: 330,
                      child: Card(
                        elevation: 1,
                        color: const Color(0xFFF7F8F9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImageResource.image6,
                              width: 120,
                              height: 120,
                            ),
                            Styles.sizedBoxH10,
                            const Text(
                              "The image must be a square.\nMinimum 1000X1000 pixels",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Styles.sizedBoxH15,
                            CommonButton1(
                                label: "Upload Artwork",
                                onPressed: () async {
                                  FilePickerResult? result = await FilePicker
                                      .platform
                                      .pickFiles(type: FileType.image);

                                  if (result != null) {
                                    image = File(result.files.single.path!);
                                    setState(() {});
                                  } else {
                                    // User canceled the picker
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: SizedBox(
                      height: 330,
                      child: Stack(
                        children: [
                          Image.file(image!),
                          Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      image = null;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                  )))
                        ],
                      ),
                    ),
                  ),
            Styles.sizedBoxH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Audio File',
                  style: TextStyle(
                    color: Color(0xFF1F1C1C),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                audio != null
                    ? Text(
                        preview,
                        style: const TextStyle(
                          color: Color(0xFFF3671F),
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Styles.sizedBoxH20,
            audio == null
                ? Center(
                    child: SizedBox(
                      width: 330,
                      height: 134,
                      child: Card(
                        elevation: 1,
                        color: const Color(0xFFF7F8F9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Your file must be a WAV or MP3 format',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Styles.sizedBoxH20,
                            CommonButton1(
                                label: "Upload Audio File",
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['wav', 'mp3'],
                                  );
                                  if (result != null) {
                                    audio = File(result.files.first.path!);
                                    setState(() {});

                                    // Handle the selected file, e.g., upload it to a server
                                    if (kDebugMode) {
                                      print('Selected file: ${audio?.path}');
                                    }
                                    if (kDebugMode) {
                                      print('File path: ${audio?.path}');
                                    }
                                  } else {
                                    // User canceled the picker
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Card(
                    color: const Color(0xFFF7F8F9),
                    child: SizedBox(
                      width: 350,
                      height: 46,
                      child: DecoratedBox(
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF7F8F9),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0xFFE8ECF4)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.music_note,
                                color: AppColors.orange,
                              ),
                              Expanded(
                                child: Text(
                                  audio?.path.split('/').last ?? '',
                                  style: const TextStyle(
                                      color: Color(0xFF1F1C1C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          audio = null;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: AppColors.orange,
                                      ))),
                              // Image.asset(ImageResource.image7),
                            ],
                          )),
                    ),
                  )),
            Styles.sizedBoxH100,
            CommonButton(label: buttonName, onPressed: _changeButtonName)
          ],
        ),
      ),
    );
  }
}
