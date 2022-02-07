import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Rooms'))),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text('Rooms'),
            ],
          ),
        ),
      ),
    );
  }
}
