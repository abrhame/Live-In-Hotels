import 'package:flutter/material.dart';

import '../../../../datasources/local/dummy_data.dart';
import 'room_bottom_detail.dart';

class RoomCard extends StatefulWidget {
  final Room room;

  const RoomCard({super.key, required this.room});

  @override
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double discountedPrice = widget.room.price * 0.9; // Example discount of 10%
    double totalPrice = discountedPrice * widget.room.numberOfNights;

    return GestureDetector(
      onTap: () => _showRoomDetails(context, widget.room),
      child: Container(
        width: 310,
        margin: const EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(widget.room.imageUrls[0],
                      fit: BoxFit.cover, height: 160, width: double.infinity),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.room.name,
                              style: const TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.black),
                                const SizedBox(width: 4.0),
                                Text(
                                  '${widget.room.rating}(${widget.room.reviewCount})',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Text(
                              '${widget.room.numberOfNights} guests ',
                              style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      const Color.fromARGB(255, 124, 124, 124)),
                            ),
                            const Icon(
                              Icons.fiber_manual_record,
                              size: 4,
                              color: Color.fromARGB(255, 124, 124, 124),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '${widget.room.numberOfNights} bedrooms',
                              style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      const Color.fromARGB(255, 124, 124, 124)),
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              Icons.fiber_manual_record,
                              size: 4,
                              color: Color.fromARGB(255, 124, 124, 124),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '${widget.room.numberOfNights} beds',
                              style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      const Color.fromARGB(255, 124, 124, 124)),
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              Icons.fiber_manual_record,
                              size: 4,
                              color: Color.fromARGB(255, 124, 124, 124),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '${widget.room.numberOfNights} bathrooms',
                              style: TextStyle(
                                  fontSize: 10,
                                  color:
                                      const Color.fromARGB(255, 124, 124, 124)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            Text(
                              '€${widget.room.price}',
                              style: const TextStyle(
                                fontSize: 13,
                                decoration: TextDecoration.lineThrough,
                                color: Color.fromARGB(255, 124, 124, 124),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '€${discountedPrice.toStringAsFixed(2)} night',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.fiber_manual_record,
                              size: 6,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '€${totalPrice.toStringAsFixed(2)} total',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 124, 124, 124),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
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
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.4,
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
