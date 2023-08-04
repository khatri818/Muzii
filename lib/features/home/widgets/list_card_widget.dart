import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/image_resource.dart';

class ListViewCardWidget extends StatefulWidget {
  const ListViewCardWidget({super.key});

  @override
  State<ListViewCardWidget> createState() => _ListViewCardWidgetState();
}

class _ListViewCardWidgetState extends State<ListViewCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) {
            return Card(
              elevation: 02,
              child: ListTile(
                title: const Text(
                  "Ehsan Tera Hoga Mujh Par",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Jonita Gandhi ft. Keba Jeremiah",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                leading: Image.asset(
                  ImageResource.image2,
                ),
              ),
            );
          }),
    );
  }
}
