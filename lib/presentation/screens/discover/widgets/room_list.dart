import 'package:flutter/material.dart';

import '../../../../datasources/local/dummy_data.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double discountedPrice = room.price * 0.9; // Example discount of 10%
    double totalPrice = discountedPrice * room.numberOfNights;

    return Container(
      width: 310,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(room.imageUrl,
                fit: BoxFit.cover, height: 200, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        room.name,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.black),
                          Text(
                            '${room.rating}(${room.reviews})',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Text(
                      '${room.numberOfNights} guests . ${room.numberOfNights} bedrooms , ${room.numberOfNights} beds, ${room.numberOfNights} bathrooms'),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        '€${room.price}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text('€${discountedPrice.toStringAsFixed(2)} night'),
                      const SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.fiber_manual_record,
                        size: 6,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '€${totalPrice.toStringAsFixed(2)} total',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyRooms.length,
        itemBuilder: (context, index) {
          return RoomCard(room: dummyRooms[index]);
        },
      ),
    );
  }
}
