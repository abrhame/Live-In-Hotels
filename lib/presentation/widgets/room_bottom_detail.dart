import 'package:flutter/material.dart';
import 'package:live_in_hotels/presentation/widgets/ameties_chip.dart';
import '../../datasources/local/dummy_data.dart';
import 'book_now_card.dart';

class RoomDetailsBottomSheet extends StatelessWidget {
  final Room room;

  const RoomDetailsBottomSheet({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close the bottom sheet when tapping outside of it
        Navigator.pop(context);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20.0)), // Curvy top corners
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ImageSlider(imageUrls: room.imageUrls),
                  const SizedBox(height: 16), // Add some space at the top
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room.name,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.black,
                              size: 24,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${room.rating} (${room.reviewCount} reviews)",
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              room.roomType,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              room.hostedBy,
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Color.fromARGB(255, 129, 129, 129)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(room.hostImage),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Amenities",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        AmenitiesChips(amenities: room.amenities),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              room.checkInType,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          room.checkInDetails,
                          style: const TextStyle(
                              fontSize: 11,
                              color: Color.fromARGB(255, 129, 129, 129)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.key_rounded,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              room.experience,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          room.experienceDetails,
                          style: const TextStyle(
                              fontSize: 11,
                              color: Color.fromARGB(255, 129, 129, 129)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: BookingCard(
                      price: room.price,
                      availability: room.availability,
                      nights: room.numberOfNights,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 15.0, // Wider handle bar for easy pulling
                    alignment: Alignment.center,
                    child: Container(
                      width: 130.0, // Make the handle wider
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(214, 54, 54, 54),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Dummy Image Slider Widget
class _ImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  const _ImageSlider({required this.imageUrls});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<_ImageSlider> {
  int _currentIndex = 0; // Track the current index of the image slider

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          20.0)), // Curvy top corners for each image
                ),
                child: Image.asset(
                  widget.imageUrls[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        // Overlay for dots
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageUrls.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
        // Image index indicator
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${_currentIndex + 1} / ${widget.imageUrls.length}",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Close icon
        Positioned(
          top: 16,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        // Exit icon
        Positioned(
          top: 4,
          right: 10,
          left: 10,
          child: Container(
            height: 15.0, // Wider handle bar for easy pulling
            alignment: Alignment.center,
            child: Container(
              width: 50.0, // Make the handle wider
              height: 5.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              // Handle exit action here
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.power_settings_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
