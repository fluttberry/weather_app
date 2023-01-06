import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/constants/text_style/text_styles.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/util/weather_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic temp = '';
  String cityName = '';
  String description = '';
  String icons = '';
  bool isLoading = false;
  @override
  void initState() {
    showWeatherByLocation();
    super.initState();
  }

  Future<void> showWeatherByLocation() async {
    final position = await _getPosition();
    await getWeatherByLocation(positionBer: position);

    // log('Position Lat ${position.latitude}');
    // log('Position Log ${position.longitude}');
    // await getWeatherByLocation(position);
  }

  Future<void>? getWeatherByLocation({Position? positionBer}) async {
    setState(() {
      isLoading = true;
    });
    final clientHttp = http.Client();
    Uri uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=40.5254658&lon=72.7976182&appid=3bf0e75c85dc9da39e7eb5c655825988');
    final response = await clientHttp.get(uri);
    final jsonResponse = jsonDecode(response.body);

    final kelvin = (jsonResponse['main']['temp']);
    temp = WeatherUtil.relvinToCelsius(kelvin);
    cityName = jsonResponse['name'];
    description = WeatherUtil.getDescription(temp);
    icons = WeatherUtil.getWeatherIcon(kelvin);

    // log('temperature ${jsonResponse['main']['temp']}');
    setState(() {
      isLoading = false;
    });
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
        isLoading == true
            // ignore: prefer_const_constructors
            ? Positioned(
                top: 400,
                left: 180,
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Positioned(
                top: 200,
                left: 50,
                child: Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          '$temp\u00B0',
                          style: TextStyles.text100White,
                        ),
                        Text(
                          icons,
                          style: TextStyles.text60White,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        Positioned(
          right: 50,
          top: 400,
          child: Text(
            description,
            style: TextStyles.text25Black,
          ),
        ),
        Positioned(
          top: 700,
          left: 150,
          child: Text(
            cityName,
            style: TextStyles.text35White,
          ),
        ),
      ]),
    );
  }
}

//https://www.youtube.com/watch?v=x5b6XyHdQIU 1-23 min
//https://api.openweathermap.org/data/2.5/weather?lat=40.5254658&lon=72.7976182&appid=3bf0e75c85dc9da39e7eb5c655825988