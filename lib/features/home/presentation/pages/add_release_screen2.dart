import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/home/presentation/widget/addnew_artist.dart';
import 'package:flutter_application_1/features/home/presentation/widget/filter_chip.dart';
import '../../../../common/TextField.dart';
import '../../../../common/app_style.dart';
import '../../../../common/commonButton.dart';
import '../../../../common/style.dart';

class AddReleaseStep2 extends StatefulWidget {
  const AddReleaseStep2({super.key});

  @override
  State<AddReleaseStep2> createState() => _AddReleaseStep2State();
}

class _AddReleaseStep2State extends State<AddReleaseStep2> {
  TextEditingController primaryartistController = TextEditingController();
  TextEditingController featuringartistController = TextEditingController();
  TextEditingController lyricistController = TextEditingController();
  TextEditingController composerController = TextEditingController();
  String genredrop = '';
  final genre = <String>['A', 'B', "C"];
  List<String> allItems = [
    'Tan',
    'Tanmay S.',
    'Tanish',
    'Tanya',
    'Eva',
    'Frank',
    'Grace',
    'Henry',
    'Isabel',
    'Jack',
  ];
  List<String> itemlist = [];
  List<String> filterChips = [];

  void _addFilterChip(String chipLabel) {
    if (filterChips.length <= 2) {
      setState(() {
        filterChips.add(chipLabel);
      });
    } else {
      showSnackBar(context, "Can't add more then 3 Primary Artist");
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _removeFilterChip(String chipLabel) {
    setState(() {
      filterChips.remove(chipLabel);
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Center(
            child: Text(
              'Add New Artist',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          content: AddNewArtist(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Add Release - Step 2/3',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.sizedBoxH10,
              Text(
                "Primary Artist",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              FilterChipWidget(
                hinttext: 'Primary Artist',
                errmsg: 'Please enter Primary Artist',
                listdata: allItems,
              ),
              TextButton(
                  onPressed: _showDialog,
                  child: Text(
                    "+Add New",
                    style: Appstyle.text1,
                  )),
              Styles.sizedBoxH10,
              Text(
                "Featuring Artist",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              FilterChipWidget(
                hinttext: 'Featuring Artist',
                errmsg: 'Please enter Featuring Artist',
                listdata: allItems,
              ),
              // CommonTextFormField(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   controller: featuringartistController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter Featuring Artist';
              //     }
              //     return null;
              //   },
              //   hintText: 'Featuring Artist Name',
              //   onChanged: (value) {
              //     searchList(value);
              //   },
              // ),

              Styles.sizedBoxH10,
              Text(
                "Lyricist",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CommonTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: lyricistController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Lyricist';
                  }
                  return null;
                },
                hintText: 'Lyricist Name',
              ),
              Styles.sizedBoxH10,
              Text(
                "Composer",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CommonTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: lyricistController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Composer';
                  }
                  return null;
                },
                hintText: 'Composer Name',
              ),
              Styles.sizedBoxH20,
              CommonButton(
                label: "Next Step",
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => FilterChipDemo(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchList(String query) {
    final suggestions = allItems.where((element) {
      final listTile = element.toLowerCase();
      final input = query.toLowerCase();
      return listTile.contains(input);
    }).toList();
    setState(() {
      itemlist = suggestions;
    });
  }
}

List<String> allItems = [
  'Tan',
  'Tanmay S.',
  'Tanish',
  'Tanya',
  'Eva',
  'Frank',
  'Grace',
  'Henry',
  'Isabel',
  'Jack',
];
