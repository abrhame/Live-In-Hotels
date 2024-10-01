import 'dart:ui';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, this.height = 200.0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              image: DecorationImage(
                image: AssetImage('assets/discover_top.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              color: Colors.black
                  .withOpacity(0.5), // Black overlay with 50% opacity
            ),
          ),
          Positioned(
            top: 40.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.near_me_rounded,
                          color: Colors.white),
                      onPressed: () {
                        // Handle directions action
                      },
                    ),
                    const Text('Norway', style: TextStyle(color: Colors.white)),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle_outlined,
                      color: Colors.white),
                  onPressed: () {
                    // Handle profile action
                  },
                ),
              ],
            ),
          ),
          const Positioned(
            top: 90.0,
            left: 25.0,
            right: 25.0,
            child: Text(
              'Hey, Martin! Tell us where you want to go.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                        0.3), // Adjust opacity to enhance the blur effect
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: 'Search...',
                      hintStyle: const TextStyle(color: Colors.white),
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
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
