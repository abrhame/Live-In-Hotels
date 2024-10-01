import 'package:flutter/material.dart';
import '../../../../datasources/local/dummy_data.dart';

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
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageSlider(imageUrls: room.imageUrls),
              const SizedBox(height: 16), // Add some space at the top
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
                          "${room.roomType}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "${room.hostedBy}",
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 129, 129, 129)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(room.hostImage),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Amenities: ${room.amenities.join(', ')}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Check-in: ${room.checkInType}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Experience: ${room.experience}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Price: €${room.price} / Night\nAvailability: ${room.availability}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16), // Add some space at the bottom
            ],
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
          child: Text(
            "${_currentIndex + 1} / ${widget.imageUrls.length}",
            style: const TextStyle(color: Colors.white),
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
                color: Colors.black54.withOpacity(0.5),
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
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              // Handle exit action here
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54.withOpacity(0.5),
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
