import 'dart:ui';
import 'package:flutter/material.dart';

class MySearchWidget extends StatefulWidget {
  const MySearchWidget({super.key});

  @override
  _MySearchWidgetState createState() => _MySearchWidgetState();
}

class _MySearchWidgetState extends State<MySearchWidget> {
  // State variable to determine if text is being entered
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      left: 16.0,
      right: 16.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                  0.3), // Adjust opacity to enhance the blur effect
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Stack(
              alignment: Alignment.centerLeft, // Aligns children to the left
              children: [
                // Hint components (will disappear when typing)
                if (!_isTyping) // Only show these when not typing
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.white),
                        const SizedBox(
                            width: 8.0), // Space between icon and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Search places',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Date range',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 10.0,
                                  ),
                                ),
                                const SizedBox(
                                    width: 4.0), // Space between text
                                Icon(
                                  Icons.fiber_manual_record_rounded,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 4,
                                ),
                                const SizedBox(
                                    width: 4.0), // Space between text
                                Text(
                                  'Number of guests',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                // Actual TextField
                TextField(
                  onChanged: (text) {
                    setState(() {
                      _isTyping = text.isNotEmpty; // Update the typing state
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '', // No hint text here
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16),
                    filled: true, // Makes sure the background is filled
                    fillColor:
                        Colors.transparent, // Transparent fill to see the blur
                  ),
                  style: const TextStyle(
                      color: Colors.white), // Set text color to white
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
