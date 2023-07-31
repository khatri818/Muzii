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
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(
              "Ehsan Tera Hoga Mujh Par",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Jonita Gandhi ft. Keba Jeremiah",style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            leading: Image.asset(
              ImageResource.image2,
            ),
          );
        });
  }
}
