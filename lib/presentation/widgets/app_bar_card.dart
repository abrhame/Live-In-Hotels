import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:live_in_hotels/presentation/widgets/search_textfield.dart';

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
          MySearchWidget(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
