import 'package:flutter/material.dart';
import 'package:flutter_application_1/buscard.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> busData = [];

  Future<void> loadAsset() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    setState(() {
      busData = json.decode(jsonString);
    });
  }

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Row(children: [
            Text("When bus"),
          ]),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var data in busData)
              BusCard(
                destination: "神奈川工科大学",
              ),
          ],
        ),
      ),
    );
  }
}
