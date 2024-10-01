import 'package:flutter/material.dart';

import '../../../../datasources/local/dummy_data.dart';
import 'room_bottom_detail.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    double discountedPrice = room.price * 0.9; // Example discount of 10%
    double totalPrice = discountedPrice * room.numberOfNights;

    return GestureDetector(
      onTap: () => _showRoomDetails(context, room),
      child: Container(
        width: 310,
        margin: const EdgeInsets.only(right: 12.0),
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
              Image.asset(room.imageUrls[0],
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
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.black),
                            Text(
                              '${room.rating}(${room.reviewCount})',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                        '${room.numberOfNights} guests . ${room.numberOfNights} bedrooms , ${room.numberOfNights} beds, ${room.numberOfNights} bathrooms'),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          '€${room.price}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text('€${discountedPrice.toStringAsFixed(2)} night'),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.fiber_manual_record,
                          size: 6,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '€${totalPrice.toStringAsFixed(2)} total',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showRoomDetails(BuildContext context, Room room) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return RoomDetailsBottomSheet(
        room: room,
      );
    },
  );
}

class RoomList extends StatelessWidget {
  const RoomList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
