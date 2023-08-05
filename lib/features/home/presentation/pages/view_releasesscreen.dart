import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/constant/image_resource.dart';
import 'package:flutter_application_1/features/home/presentation/pages/tabbarview.dart';

import 'add_release_screen.dart';

class ViewReleasesScreen extends StatefulWidget {
  const ViewReleasesScreen({super.key});

  @override
  State<ViewReleasesScreen> createState() => _ViewReleasesScreenState();
}

class _ViewReleasesScreenState extends State<ViewReleasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                ImageResource.muziiLogo,
              ),
              const Expanded(child: TabBarViewData()),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.orange,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddReleaseScreen(),
              ),
            );
          },
          tooltip: "Increment",
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.black,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.music_note),
                color: AppColors.orange,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: AppColors.orange,
              ),
            ],
          ),
        ));
  }
}
