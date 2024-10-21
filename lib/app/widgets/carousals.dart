import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousals extends StatelessWidget {
  Carousals({super.key});

  final List<String> imageUrls = [
    'assets/carousal_1.png',
    'assets/carousal_2.png',
    'assets/carousal_3.png',
    'assets/carousal_4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 2.5,
        enlargeCenterPage: false,
        viewportFraction: 1,
        scrollDirection: Axis.horizontal,
      ),
      items: imageUrls.map((imageUrl){
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}