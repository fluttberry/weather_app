import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(
                      color: Colors.green,
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
            )
          ],
        ),
      ),
    );
  }
}

//https://www.youtube.com/watch?v=NyZRJK37fUI 21 min