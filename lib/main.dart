import 'package:creative_fabrica_assignment/bloc_observer.dart';
import 'package:creative_fabrica_assignment/data/helpers/firebase_remote_config_service.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/login/login_cubit.dart';
import 'package:creative_fabrica_assignment/presentation/bloc/mars_photos/mars_photos_cubit.dart';
import 'package:creative_fabrica_assignment/presentation/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection.dart' as di;

Future<void> main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseRemoteConfigService().initialize();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

/// This widget is the entry-point of the Widget-tree.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Initialize global state management, keep this to a minimum.
      providers: [
        BlocProvider(
          create: (_) => di.locator<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MarsPhotosCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Creative Fabrica Assignment',
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 22.0),
              labelLarge: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                fontSize: 14.0,
              ),
              titleMedium: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              labelSmall: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                letterSpacing: 0.2,
              )),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
