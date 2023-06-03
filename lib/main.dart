import 'package:flutter/material.dart';
import 'package:todo/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/provider/todo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox('My_App');
  runApp(const MyApp());
}

Box TodoBox = Hive.box('My_App');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => TaskProvider()))
      ],
      child: MaterialApp(
        // color: Colors.black,

        // title: 'Flutter Demo'
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 52, 80, 161),
          appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 52, 80, 161)),
          // scaffoldBackgroundColor: const Color.fromARGB(255, 35, 79, 182),
          useMaterial3: true,
          // primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
