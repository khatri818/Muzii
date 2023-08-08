import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/constant/image_resource.dart';

import '../../../../common/TextField.dart';
import '../../../../common/app_style.dart';
import '../../../../common/commonButton.dart';
import '../../../../common/style.dart';
import 'filterbutton.dart';

class AddNewArtist extends StatefulWidget {
  const AddNewArtist({super.key});

  @override
  State<AddNewArtist> createState() => _AddNewArtistState();
}

class _AddNewArtistState extends State<AddNewArtist> {
  TextEditingController artistnameController = TextEditingController();
  TextEditingController spotifyController = TextEditingController();
  TextEditingController applemusicController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController youtubeController = TextEditingController();
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Image.asset(ImageResource.image5),
          content: const Text(
            'Eric Clapton added successfully!',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Styles.sizedBoxH10,
            Text(
              "Artist Name",
              style: Appstyle.text1,
            ),
            Row(
              children: [
                const FilterButton('All Orders'),
                const FilterButton('Pending'),
              ],
            ),
            Styles.sizedBoxH06,
            CommonTextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: artistnameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Artist Name';
                }
                return null;
              },
              hintText: 'e.g. John Doe',
            ),
            Styles.sizedBoxH06,
            Text(
              "Spotify URL",
              style: Appstyle.text1,
            ),
            Styles.sizedBoxH10,
            CommonTextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: spotifyController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Spotify URL';
                }
                return null;
              },
              hintText: '',
            ),
            Styles.sizedBoxH06,
            Text(
              "Apple Music URL",
              style: Appstyle.text1,
            ),
            Styles.sizedBoxH10,
            CommonTextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: applemusicController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Apple Music URL';
                }
                return null;
              },
              hintText: '',
            ),
            Styles.sizedBoxH06,
            Text(
              "Instagram URL*",
              style: Appstyle.text1,
            ),
            Styles.sizedBoxH10,
            CommonTextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: instagramController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Instagram URL';
                }
                return null;
              },
              hintText: '',
            ),
            Styles.sizedBoxH06,
            Text(
              "YouTube URL",
              style: Appstyle.text1,
            ),
            Styles.sizedBoxH10,
            CommonTextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: youtubeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter YouTube URL';
                }
                return null;
              },
              hintText: 'e.g. John Doe',
            ),
            Styles.sizedBoxH30,
            CommonButton(
              label: "Add Artist",
              onPressed: _showDialog,
            ),
          ],
        ),
      ),
    );
  }
}
