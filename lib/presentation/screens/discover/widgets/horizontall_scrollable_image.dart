import 'package:flutter/material.dart';

class HorizontalImageCards extends StatelessWidget {
  final List<String> imageUrls;

  const HorizontalImageCards({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.12, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Curve the edges
              child: Image.asset(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
