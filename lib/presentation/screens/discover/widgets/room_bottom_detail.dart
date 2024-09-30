  import 'package:flutter/material.dart';
  import '../../../../datasources/local/dummy_data.dart';

  class RoomDetailsBottomSheet extends StatelessWidget {
    final Room room;

    RoomDetailsBottomSheet({Key? key, required this.room}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onTap: () {
          // Close the bottom sheet when tapping outside of it
          Navigator.pop(context);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0)), // Curvy top corners
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Size the column based on content
              children: [
                _ImageSlider(imageUrls: room.imageUrls),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    room.name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Rating: ${room.rating} (${room.reviewCount} reviews)",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Type: ${room.roomType}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Amenities: ${room.amenities.join(', ')}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Check-in: ${room.checkInType}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Experience: ${room.experience}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Price: €${room.price} / Night\nAvailability: ${room.availability}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16), // Add some space at the bottom
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

    const _ImageSlider({Key? key, required this.imageUrls}) : super(key: key);

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
                  decoration: BoxDecoration(
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
              style: TextStyle(color: Colors.white),
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
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.exit_to_app,
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
