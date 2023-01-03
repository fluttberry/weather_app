import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants/text_style/text_styles.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    showWeatherByLocation();
    super.initState();
  }

  Future<void> showWeatherByLocation() async {
    final position = await _getPosition();
    log('Position ${position.latitude}');
    log('Position ${position.longitude}');
    // await getWeatherByLocation(position);
  }

  Future<void>? getWeatherByLocation(Position? position) {
    final response = http.Client();
    final data = response;
  }

//GPS
  Future<Position> _getPosition() async {
    bool? serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    } else {
      return await Geolocator.getCurrentPosition();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const SearchPage()),
                ),
              );
            },
            child: const Icon(
              Icons.location_city,
              size: 50,
            ),
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
          top: 200,
          left: 50,
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    '8\u00B0',
                    style: TextStyles.text100White,
                  ),
                  const Text(
                    '🔅',
                    style: TextStyles.text60White,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          left: 10,
          top: 400,
          child: Text(
            '''
            Жылуу кийинип чык
            Жылуу кийинип чык
            Жылуу кийинип чык
            ''',
            style: TextStyles.text25Black,
          ),
        ),
        const Positioned(
          top: 700,
          left: 150,
          child: Text(
            'Bishkek',
            style: TextStyles.text35White,
          ),
        ),
      ]),
    );
  }
}
