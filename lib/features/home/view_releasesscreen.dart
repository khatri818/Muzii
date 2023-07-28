import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/constant/image_resource.dart';

class ViewReleasesScreen extends StatefulWidget {
  const ViewReleasesScreen({super.key});

  @override
  State<ViewReleasesScreen> createState() => _ViewReleasesScreenState();
}

class _ViewReleasesScreenState extends State<ViewReleasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Image.asset(
          ImageResource.muziiLogo,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImageResource.image2,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
