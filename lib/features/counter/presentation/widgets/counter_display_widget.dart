import 'package:flutter/material.dart';

class CounterDisplayWidget extends StatelessWidget {
  final int count;

  const CounterDisplayWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'You have pushed the button this many times:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 12),
        Text(
          '$count',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
