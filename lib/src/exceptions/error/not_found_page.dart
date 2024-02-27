import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 64,
            width: 64,
            child: Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
          Text(
            'Page Not Found!',
            style: Theme.of(context).textTheme.headlineLarge,
          )
        ],
      ),
    );
  }
}
