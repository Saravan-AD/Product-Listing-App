import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('User Name', style: TextStyle(fontSize: 24)),
          Text('Phone Number', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
