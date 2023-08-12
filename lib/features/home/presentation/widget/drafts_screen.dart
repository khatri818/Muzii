import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/style.dart';

import 'card_widget.dart';
import 'list_card_widget.dart';

class DraftsScreen extends StatefulWidget {
  const DraftsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DraftsScreenState createState() => _DraftsScreenState();
}

class _DraftsScreenState extends State<DraftsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Set the number of tabs here
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
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.grey,
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 45),
            labelColor: AppColors.orange,
            unselectedLabelColor: AppColors.grey,
            
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            tabs: const [
              Row(
                children: [
                  Tab(
                    text: 'List',
                  ),
                  Styles.sizedBoxW06,
                  Icon(Icons.list)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.tv_sharp),
                  Styles.sizedBoxW06,
                  Tab(
                    text: 'Card',
                  ),
                ],
              ),
            ],
          ),
          Expanded(
              child: TabBarView(controller: _tabController, children: [
            const ListViewCardWidget(),
            CardList(),
          ]))
        ],
      ),
    );
  }
}
