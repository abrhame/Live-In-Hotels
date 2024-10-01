import 'package:flutter/material.dart';
import 'package:live_in_hotels/presentation/widgets/room_list.dart';

import '../../widgets/app_bar_card.dart';
import '../../widgets/horizontall_scrollable_image.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: const CustomAppBar(height: 200.0),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.only(left: 20.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.0),
              Text(
                'The most relevant ',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.0),
              RoomList(),
              SizedBox(height: 16.0),
              Text(
                'Discover new places',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.0),
              HorizontalImageCards(
                imageUrls: [
                  'assets/discover_top.jpg',
                  'assets/discover_top.jpg',
                  'assets/discover_top.jpg',
                  'assets/discover_top.jpg',
                ],
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
