import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_cubit.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_state.dart';
import 'package:creative_fabrica_assignment/presentation/pages/photo_page.dart';
import 'package:creative_fabrica_assignment/presentation/widgets/loading.dart';
import 'package:creative_fabrica_assignment/presentation/widgets/photo_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

/// Page containing all the elements needed for a complete [MarsPhotosPage].
/// The page includes a `listview` with list tiles containing an image, a title
/// an object number, and the first known author
class MarsPhotosPage extends StatefulWidget {
  const MarsPhotosPage({Key? key}) : super(key: key);

  @override
  State<MarsPhotosPage> createState() => _MarsPhotosPageState();
}

class _MarsPhotosPageState extends State<MarsPhotosPage> {
  late TextEditingController textController;
  late ScrollController scrollController = ScrollController();

  /// Calls [fetchMarsPhotos] as soon as possible to get data for the page.
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    context.read<MarsPhotosCubit>().fetchMarsPhotos();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        context.read<MarsPhotosCubit>().fetchMarsPhotos();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mars Photos',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true, // or false
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Enter Solar day',
              ),
              controller: textController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              onSubmitted: (term) {
                context.read<MarsPhotosCubit>().filterOnSol(term);
                scrollController.jumpTo(0);
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: BlocBuilder<MarsPhotosCubit, MarsPhotosState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Loading(message: 'Loading data...'),
                  hasData: (data, page) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            key: const Key('photo_data_listview'),
                            itemCount: data.length,
                            controller: scrollController,
                            itemBuilder: (context, index) {
                              Photo photo = data[index];
                              return InkWell(
                                key: Key(photo.id.toString()),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PhotoPage(photo: photo),
                                    ),
                                  );
                                },
                                child: PropertyOverview(
                                  thumbnail: Hero(
                                    tag: "${photo.id}hero",
                                    child: Image(
                                      fit: BoxFit.cover,
                                      // TODO: use CachedNetworkImage
                                      image: NetworkImage(photo.imgSrc!),
                                    ),
                                  ),
                                  title: DateFormat('MMM d, yyyy').format(photo.earthDate!),
                                  subtitle: photo.camera!.fullName!,
                                  bottomSubText: photo.rover!.name!,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  empty: () => Center(
                    key: const Key('photos_empty_widget'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('No photos found.'),
                        TextButton.icon(
                            onPressed: () {
                              textController.value = TextEditingValue.empty;
                              context.read<MarsPhotosCubit>().reset();
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text('Reset'))
                      ],
                    ),
                  ),
                  error: (_) => Center(
                    key: const Key('photos_error_widget'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Something went wrong, try again.'),
                        TextButton.icon(
                            onPressed: () {
                              textController.value = TextEditingValue.empty;
                              context.read<MarsPhotosCubit>().fetchMarsPhotos();
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'))
                      ],
                    ),
                  ),
                  orElse: () => Center(
                    key: const Key('unknown_error_widget'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Something went wrong, try again.'),
                        TextButton.icon(
                            onPressed: () {
                              textController.value = TextEditingValue.empty;
                              context.read<MarsPhotosCubit>().fetchMarsPhotos();
                            },
                            icon: const Icon(Icons.refresh),
                            label: const Text('Retry'))
                      ],
                    ),
                  ),
                );
                // only show error when `state.hasError && state.artObjects.isEmpty` else the error widget
                // is shown even if we have art objects to display
              },
            ),
          ),
        ],
      ),
    );
  }
}
