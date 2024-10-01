import 'package:flutter/material.dart';

class AmenitiesChips extends StatelessWidget {
  final List<String> amenities;

  const AmenitiesChips({super.key, required this.amenities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
      child: Wrap(
        spacing: 2.0, // Very little space between chips
        runSpacing: 3.0, // Negative value to reduce space between lines
        children: amenities.map((amenity) {
          return Chip(
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0), // Very curvy chip
            ),
            label: Text(
              amenity,
              style: const TextStyle(fontSize: 10), // Smaller text size
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            backgroundColor: Colors.grey[200], // Chip background color
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
            materialTapTargetSize: MaterialTapTargetSize
                .shrinkWrap, // Reduces the vertical size of the chip
          );
        }).toList(),
      ),
    );
  }
}
