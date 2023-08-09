import 'package:flutter/material.dart';

import '../../../../common/TextField.dart';
import '../../../../common/app_colors.dart';

class FilterChipWidget extends StatefulWidget {
  final String hinttext;
  final String errmsg;
  final List<String> listdata;
  final void adddata;
  const FilterChipWidget({
    super.key,
    required this.hinttext,
    required this.errmsg,
    required this.listdata,
    this.adddata,
  });

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
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

  TextEditingController primaryartistController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> allItem = widget.listdata;
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
              padding: EdgeInsets.all(4.0),
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
                        _addFilterChip(item);
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
