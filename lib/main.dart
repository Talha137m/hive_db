import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_data_base/data_base_provider/student_adaptor.dart';
import 'package:hive_data_base/data_base_provider/student_data_base.dart';
import 'package:hive_data_base/models/student.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationSupportDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(StudentAdaptor());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StudentDataBaseProvider studentDataBaseProvider = StudentDataBaseProvider();

  void _incrementCounter() async {
    var result = await studentDataBaseProvider.insertStudent(
        student: Student(
            department: 'cs', name: 'talha', rollNo: 12, fee: 676373.8));
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
              tooltip: 'fetch',
              onPressed: () async {
                List<Student> list =
                    await studentDataBaseProvider.fetchStudent();
                print(list);
              })
        ],
      ),
    );
  }
}
