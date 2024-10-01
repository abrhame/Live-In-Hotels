import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

import 'package:live_in_hotels/presentation/widgets/messages.dart';

import '../../datasources/local/dummy_data.dart';

class FloatingBottomNavBar extends StatefulWidget {
  final Widget child;

  const FloatingBottomNavBar({super.key, required this.child});

  @override
  _FloatingBottomNavBarState createState() => _FloatingBottomNavBarState();
}

class _FloatingBottomNavBarState extends State<FloatingBottomNavBar> {
  int _selectedIndex = 0;
  bool _isBottomBarVisible = true;
  Timer? _hideTimer;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      showMessagesBottomSheet(context, dummy_messages, isLoading: true);
    }
  }

  void _resetHideTimer() {
    if (_hideTimer != null) {
      _hideTimer!.cancel();
    }
    setState(() {
      _isBottomBarVisible = true;
    });
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _isBottomBarVisible = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _resetHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        _resetHideTimer();
        return true;
      },
      child: Stack(
        children: [
          widget.child,
          if (_isBottomBarVisible)
            Positioned(
              left: 16.0,
              right: 16.0,
              bottom:
                  18.0, // Place closer to the bottom and above the pull-up bar
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(
                          0.5), // Blackish background with 50% opacity
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.white.withOpacity(
                          0.8), // Increase visibility for unselected items
                      currentIndex: _selectedIndex,
                      onTap: (index) {
                        _onItemTapped(index);
                        _resetHideTimer(); // Show bottom bar when a button is tapped
                      },
                      type: BottomNavigationBarType.fixed,
                      iconSize: 20.0, // Smaller icon size to reduce touch area
                      items: const [
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(
                                4.0), // Reduce padding to minimize touch effect area
                            child: Icon(Icons.explore),
                          ),
                          label: 'Discover',
                        ),
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.favorite_border),
                          ),
                          label: 'Favourites',
                        ),
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.book),
                          ),
                          label: 'Bookings',
                        ),
                        BottomNavigationBarItem(
                          icon: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.message),
                          ),
                          label: 'Messages',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy < 0) {
                  // User is pulling up
                  setState(() {
                    _isBottomBarVisible = true;
                  });
                  _resetHideTimer();
                }
              },
              child: Container(
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
            ),
          ),
        ],
      ),
    );
  }
}

void showMessagesBottomSheet(BuildContext context, List<Message>? messages,
    {bool isLoading = false}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // Set background to transparent
    builder: (context) {
      return const MessagesBottomSheet(); // No need for the outer Container
    },
  );
}
