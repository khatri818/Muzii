import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/image_resource.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  double value = 0;
  double _currentSliderValue = 0.0;
  final double _totalSongDuration =
      180.0; // Total duration of the song in seconds
  String formatDuration(double seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = (seconds % 60).toInt();
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    double currentMinute = (_currentSliderValue / 60.0);
    double totalMinute = (_totalSongDuration / 60.0);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            // image: NetworkImage("https://picsum.photos/id/237/200/300"),//network image
            image: AssetImage(ImageResource.image2),

            fit: BoxFit.cover,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black, // Adjust the opacity as needed
                Colors.black
                    .withOpacity(0.2), // You can customize this color too
              ],
            ),
          ),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "playing reccommeded song for you",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
              const Expanded(
                child: SizedBox(height: 40),
              ),
              Container(
                height: 280,
                width: MediaQuery.of(context).size.width,
                // padding: EdgeInsets.all(20),
                //title
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Run Free",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Deep Chills,IVIE",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      //slider
                      SliderTheme(
                        data: const SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        ),
                        child: Slider(
                          value: _currentSliderValue,
                          min: 0.0,
                          max: _totalSongDuration,
                          onChanged: (newValue) {
                            setState(() {
                              _currentSliderValue = newValue;
                            });
                          },
                          activeColor: Colors.white,
                          inactiveColor: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formatDuration(_currentSliderValue),
                                style: const TextStyle(color: Colors.grey)),
                            Text(formatDuration(_totalSongDuration),
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      //Controll Buttons
                      SizedBox(
                        // height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.backward),
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 15,
                              ),

                              Container(
                                height: 65,
                                width: 65,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Center(
                                    child: FaIcon(FontAwesomeIcons.play)),
                              ),
                              const SizedBox(
                                width: 15,
                              ),

                              // IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.backward), color: Colors.white,),
                              IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.forward),
                                color: Colors.white,
                              ),
                            ]),
                      )
                    ]),
              )
            ],
          ), // You can place your widgets here
        ),
      ),
    );
  }
}
