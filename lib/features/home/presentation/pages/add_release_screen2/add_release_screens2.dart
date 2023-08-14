import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/features/home/presentation/pages/add_release_screen2/add_release_coverart.dart';
import 'package:flutter_application_1/features/home/presentation/widget/addnew_artist.dart';

import '../../../../../common/TextField.dart';
import '../../../../../common/app_style.dart';
import '../../../../../common/common_button.dart';
import '../../../../../common/style.dart';

class AddReleaseSteps2 extends StatefulWidget {
  const AddReleaseSteps2({super.key});

  @override
  State<AddReleaseSteps2> createState() => _AddReleaseSteps2State();
}

class _AddReleaseSteps2State extends State<AddReleaseSteps2> {
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
  List<String> filterChips2 = [];
  List<String> filterChips = [];

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              FilterChipWidgets(
                hinttext: 'Primary Artist',
                errmsg: 'Please enter Primary Artist',
                listdata: allItems,
                adddata: (String chipLabel) {
                  if (filterChips.length <= 2) {
                    setState(() {
                      filterChips.add(chipLabel);
                    });
                  } else {
                    showSnackBar(
                        context, "Can't add more then 3 Primary Artist");
                  }
                  return filterChips;
                },
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
              FilterChipWidgets(
                hinttext: 'Featuring Artist',
                errmsg: 'Please enter Featuring Artist',
                listdata: allItems,
                adddata: (chipLabel) {
                  setState(() {
                    filterChips2.add(chipLabel);
                  });
                  return filterChips2;
                },
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
              Styles.sizedBoxH100,
              Styles.sizedBoxH100,
              CommonButton(
                label: "Next Step",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CoverArtPage(),
                    ),
                  );
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

class FilterChipWidgets extends StatefulWidget {
  final String hinttext;
  final String errmsg;
  final List<String> listdata;
  final List<String> Function(String chipLabel) adddata;
  const FilterChipWidgets({
    super.key,
    required this.hinttext,
    required this.errmsg,
    required this.listdata,
    required this.adddata,
  });

  @override
  State<FilterChipWidgets> createState() => _FilterChipWidgetsState();
}

class _FilterChipWidgetsState extends State<FilterChipWidgets> {
  List<String> itemlist = [];
  List<String> filterChips = [];

  // void _addFilterChip(String chipLabel) {
  //   if (filterChips.length <= 2) {
  //     setState(() {
  //       filterChips.add(chipLabel);
  //     });
  //   } else {
  //     showSnackBar(context, "Can't add more then 3 Primary Artist");
  //   }
  // }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _removeFilterChip(String chipLabel) {
    setState(() {
      filterChips.remove(chipLabel);
    });
  }

  TextEditingController primaryartistController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: primaryartistController,
          // enabled: false,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return widget.errmsg;
            }
            return null;
          },
          hintText: widget.hinttext,
          onChanged: (value) {
            searchList(value);
          },
        ),
        Wrap(
          children: filterChips.map((chipLabel) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Chip(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                deleteIcon: const Icon(
                  Icons.clear,
                  color: AppColors.orange,
                ),
                label: Text(chipLabel),
                onDeleted: () {
                  _removeFilterChip(chipLabel);
                },
              ),
            );
          }).toList(),
        ),
        itemlist.isEmpty
            ? const SizedBox.shrink()
            : SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemlist.length,
                  itemBuilder: (context, index) {
                    final item = itemlist[index];
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        filterChips = widget.adddata(item);
                        setState(() {
                          itemlist = [];
                          primaryartistController.clear();
                          FocusScope.of(context).unfocus();
                        });
                      },
                    );
                  },
                ),
              ),
      ],
    );
  }

  void searchList(String query) {
    final suggestions = widget.listdata.where((element) {
      final listTile = element.toLowerCase();
      final input = query.toLowerCase();
      return listTile.contains(input);
    }).toList();
    setState(() {
      itemlist = suggestions;
    });
  }
}
