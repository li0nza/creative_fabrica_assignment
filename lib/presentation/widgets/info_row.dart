import 'package:flutter/material.dart';

/// Generic widget to make displaying data in a row easier
class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 3,
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        Expanded(
          flex: 4,
          child: Text(body, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.normal)),
        ),
      ]),
    );
  }
}
