import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key, required this.title, required this.count});
  final String title;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
