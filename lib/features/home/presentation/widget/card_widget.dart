import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style.dart';
import 'package:flutter_application_1/constant/image_resource.dart';

// ignore: use_key_in_widget_constructors
class CardList extends StatelessWidget {
  final List<CardItem> cards = [
    CardItem(
      title: 'Ehsan Tera Hoga Mujh Par',
      description: 'Jonita Gandhi ft. Keba Jeremiah',
      imageAsset: ImageResource.image2,
    ),
    CardItem(
      title: 'Kesariya',
      description: 'Arijit Singh',
      imageAsset: ImageResource.image3,
    ),
    CardItem(
      title: 'Kesariya',
      description: 'Arijit Singh',
      imageAsset: ImageResource.image3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return CardWidget(cardItem: cards[index]);
      },
    );
  }
}

class CardItem {
  final String title;
  final String description;
  final String imageAsset;

  CardItem({
    required this.title,
    required this.description,
    required this.imageAsset,
  });
}

class CardWidget extends StatelessWidget {
  final CardItem cardItem;

  const CardWidget({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          children: [
            Image.asset(
              cardItem.imageAsset,
              fit: BoxFit.fill,
              width: 500,
            ),
            Text(
              cardItem.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Styles.sizedBoxH06,
            Text(
              cardItem.description,
              style: const TextStyle(fontSize: 16),
            ),
            Styles.sizedBoxH06,
          ],
        ),
      ),
    );
  }
}
