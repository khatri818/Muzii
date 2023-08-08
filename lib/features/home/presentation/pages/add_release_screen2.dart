import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/widget/addnew_artist.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
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

              DropdownSearch(
                items: ["Brazil", "France", "Tunisia", "Canada"],
                onChanged: print,
                selectedItem: "Tunisia",
                validator: (String? item) {
                  if (item == null)
                    return "Required field";
                  else if (item == "Brazil")
                    return "Invalid item";
                  else
                    return null;
                },
              ),
              TextButton(
                  onPressed: _showDialog,
                  child: Text(
                    "+Add New",
                    style: Appstyle.text1,
                  )),

              // DropdownSearch<String>(
              //   popupProps: PopupProps.menu(
              //     showSelectedItems: true,
              //     disabledItemFn: (String s) => s.startsWith('I'),
              //   ),
              //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              //   dropdownDecoratorProps: DropDownDecoratorProps(
              //     dropdownSearchDecoration: InputDecoration(
              //       labelText: "Menu mode",
              //       hintText: "country in menu mode",
              //     ),
              //   ),
              //   onChanged: print,
              //   selectedItem: "Brazil",
              // ),

              Styles.sizedBoxH10,
              Text(
                "Featuring Artist",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CommonTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: featuringartistController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Featuring Artist';
                  }
                  return null;
                },
                hintText: 'Featuring Artist Name',
              ),
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
              Styles.sizedBoxH10,
              CommonButton(
                label: "Next Step",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
