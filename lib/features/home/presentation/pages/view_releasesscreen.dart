import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/style.dart';
import 'package:flutter_application_1/constant/image_resource.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter_application_1/features/home/presentation/pages/tabbarview.dart';

import '../../../musicplayer/presentation/pages/music_player_screen.dart';
import '../../../services/auth_service.dart';
import 'add_release_screen.dart';

class ViewReleasesScreen extends StatefulWidget {
  const ViewReleasesScreen({super.key});

  @override
  State<ViewReleasesScreen> createState() => _ViewReleasesScreenState();
}

class _ViewReleasesScreenState extends State<ViewReleasesScreen> {
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white.withOpacity(0),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: AppColors.orange,
                size: 25,
              ),
              onPressed: () async {
                await authClass.logout(context);
              }, // Call the logout function
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Styles.sizedBoxH50,
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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MusicPlayerScreen(),));
                },
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
