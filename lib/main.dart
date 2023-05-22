import 'package:flutter/material.dart';
import 'package:todo/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/task_provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('TaskDb');
  runApp(const MyApp());
}
final TaskDatabase = Hive.box('TaskDb');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[ChangeNotifierProvider(create: ((context) => TaskProvider()))],
      child: MaterialApp(
        // title: 'Flutter Demo'
        theme: ThemeData(
          // appBarTheme: const AppBarTheme(
              // backgroundColor: Color.fromARGB(255, 35, 79, 182)),
          // scaffoldBackgroundColor: const Color.fromARGB(255, 35, 79, 182),
          useMaterial3: true,
          // primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}

