import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../../common/app_style.dart';
import '../../../../../common/commonButton.dart';
import '../../../../../common/style.dart';

class AddReleaseScreen3 extends StatefulWidget {
  const AddReleaseScreen3({super.key});

  @override
  State<AddReleaseScreen3> createState() => _AddReleaseScreen3State();
}

class _AddReleaseScreen3State extends State<AddReleaseScreen3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  if (item == null) {
                    return "Required field";
                  } else if (item == "Brazil") {
                    return "Invalid item";
                  } else {
                    return null;
                  }
                },
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