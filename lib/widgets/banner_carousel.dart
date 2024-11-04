// banner_carousel.dart

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:saheel_machine_test/model/banner_model.dart';
import 'package:saheel_machine_test/utils/config.dart';

class BannerCarousel extends StatelessWidget {
  final List<BannerModel> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (context, index, realIndex) {
        final url = banners[index].banner ?? '';
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              Config.baseMediaUrl+url,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: false,
        aspectRatio: 2.0,
        viewportFraction: 0.6,
      ),
    );
  }
}
