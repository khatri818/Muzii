import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';

class MyTabBarView extends StatefulWidget {
  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 3, vsync: this); // Set the number of tabs here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // Creates border
              color: Colors.greenAccent),
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Add the content for each tab here
          Center(child: Text('Content for Tab 1')),
          Center(child: Text('Content for Tab 2')),
          Center(child: Text('Content for Tab 3')),
        ],
      ),
    );
  }
}
