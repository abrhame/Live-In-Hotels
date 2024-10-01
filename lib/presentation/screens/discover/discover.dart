import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:live_in_hotels/presentation/screens/discover/widgets/room_list.dart';

import 'widgets/app_bar_card.dart';
import 'widgets/horizontall_scrollable_image.dart';

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
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: CustomAppBar(height: 200.0),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
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
              const SizedBox(height: 8.0),
              RoomList(),
              const SizedBox(height: 16.0),
              Text(
                'Discover new places',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8.0),
              HorizontalImageCards(
                imageUrls: [
                  'assets/discover_top.jpg',
                  'assets/discover_top.jpg',
                  'assets/discover_top.jpg',
                  'assets/discover_top.jpg',
                ],
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
