import 'package:flutter/material.dart';
import 'package:weather_app/constants/colors/colors.dart';
import 'package:weather_app/constants/text_style/text_styles.dart';

class SearchPage extends StatelessWidget {
   SearchPage({super.key});
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg_image.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: TextField(
                controller: textEditingController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 4.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(
                      color: Colors.purple,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context, textEditingController.text);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.grey.withOpacity(0.3),
                foregroundColor: Colors.white,
                // backgroundColor: Colors.transparent,
                side: const BorderSide(color: Colors.black, width: 3),
              ),
              child: const SizedBox(
                width: 150,
                // ignore: prefer_const_constructors
                child: Text('Select city',
                    textAlign: TextAlign.center, style: TextStyles.text20Black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
