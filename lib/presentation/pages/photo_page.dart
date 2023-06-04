import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:creative_fabrica_assignment/presentation/widgets/info_row.dart';
import 'package:creative_fabrica_assignment/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

/// Page containing all the elements needed for a complete [PhotoPage].
/// Requires an instance of [ArtObject] to display an image and title while loading.
/// The page includes a `listview` with an image of the art work, the `title`, `description`,
/// `medium used`, `titles`,` object types` and `object number`
class PhotoPage extends StatelessWidget {
  const PhotoPage({
    super.key,
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Photo #${photo.id}',
            style: const TextStyle(color: Colors.red),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  InfoRow(
                    body: DateFormat('MMM d, yyyy').format(photo.earthDate!),
                    title: 'Earth date:',
                  ),
                  InfoRow(
                    body: photo.sol.toString(),
                    title: 'Sol:',
                  ),
                  InfoRow(
                    body: photo.id.toString(),
                    title: 'Photo Id:',
                  ),
                  InfoRow(
                    body: photo.camera!.fullName!,
                    title: 'Camera name:',
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: PhotoView(
                imageProvider: NetworkImage(photo.imgSrc!),
              ),
            ),
          ],
        ));
  }
}
