import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.network("https://via.placeholder.com/300", width: 300),
          Image.network("https://via.placeholder.com/300", width: 300),
          Image.network("https://via.placeholder.com/300", width: 300),
        ],
      ),
    );
  }
}
