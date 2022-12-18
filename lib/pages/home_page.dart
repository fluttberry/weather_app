import 'package:flutter/material.dart';
import 'package:weather_app/constants/text_style/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        actions: const [
          Icon(
            Icons.location_city,
            size: 50,
          ),
        ],
        leading: Image.asset(
          'assets/images/location.png',
          scale: 10,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Container(
          child: null,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bg_image.jpg'),
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 50,
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    '8',
                    style: TextStyles.text100White,
                  ),
                ],
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Жылуу кийинип чык',
                    style: TextStyles.text25Black,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Data'),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
