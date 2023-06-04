import 'package:flutter/material.dart';

/// List tile showing an `image`, `title`, `subtitle`, and a row of `bottom text`
class PropertyOverview extends StatelessWidget {
  const PropertyOverview({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.bottomSubText,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String bottomSubText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 180,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                color: Colors.grey,
                child: thumbnail,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 4, 8),
                child: _PropertyOverviewDescription(
                  title: title,
                  subtitle: subtitle,
                  bottomSubText: bottomSubText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PropertyOverviewDescription extends StatelessWidget {
  const _PropertyOverviewDescription({
    required this.title,
    required this.subtitle,
    required this.bottomSubText,
  });

  final String title;
  final String subtitle;
  final String bottomSubText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 4,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(bottomSubText, style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ),
      ],
    );
  }
}
