import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/app_style.dart';
import 'package:flutter_application_1/common/style.dart';
import 'package:flutter_application_1/constant/image_resource.dart';
import 'package:flutter_application_1/features/home/widgets/drafts_screen.dart';

class TabBarViewData extends StatefulWidget {
  const TabBarViewData({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarViewDataState createState() => _TabBarViewDataState();
}

class _TabBarViewDataState extends State<TabBarViewData>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this); // Set the number of tabs here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Styles.sizedBoxH10,
          Styles.sizedBoxH15,
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(12), // Creates border
                        color: AppColors.orange),
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 45),
                    labelColor: AppColors.white,
                    unselectedLabelColor: AppColors.grey,
                    labelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    tabs: const [
                      Tab(
                        text: 'Drafts',
                      ),
                      Tab(text: 'In Review'),
                      Tab(text: 'Verifiled'),
                      Tab(text: 'List'),
                    ],
                  ),
                ),
              )),
          Expanded(
              child: TabBarView(controller: _tabController, children: const [
            DraftsScreen(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ]))
        ],
      ),
    );
  }
}
