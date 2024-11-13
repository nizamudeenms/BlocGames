import 'package:bloc_games/ui/home/pages/home_page.dart';
import 'package:bloc_games/utils/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Future main() async {
//   await dotenv.load(fileName: "assets/.env");
//   BlocOverrides.runZoned(
//         () => runApp(const MyApp()),
//     blocObserver: AppBlocObserver(),
//   );
// }

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  Bloc.observer = AppBlocObserver();
  Bloc.transformer = (events, mapper) {
    return events.asyncExpand(mapper);
  };
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc games',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
