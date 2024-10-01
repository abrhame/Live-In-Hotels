import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String availability; // Availability of the room
  final double price; // Price per night
  final int nights;

  const BookingCard({
    super.key,
    required this.availability,
    required this.price,
    required this.nights,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7), // Black background
        borderRadius: BorderRadius.circular(40.0), // Curved edges
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    availability,
                    style: const TextStyle(
                      fontSize: 12, // Small font size for availability
                      color: Colors.white, // White text color
                    ),
                  ),
                  const SizedBox(width: 4.0), // Space between the texts
                  const Icon(
                    Icons.fiber_manual_record_sharp,
                    size: 5,
                    color: Colors.white, // White icon color
                  ),
                  const SizedBox(width: 4.0), // Space between the texts
                  Text(
                    "$nights nights",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white, // White text color
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4.0), // Space between the texts
              Text(
                "€$price",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text color
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Handle book now action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // White background for button
              foregroundColor: Colors.black, // Black text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Rounded button
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            ),
            child: const Text("Book Now"),
          ),
        ],
      ),
    );
  }
}
