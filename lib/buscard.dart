import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class BusCard extends StatefulWidget {
  const BusCard({
    Key? key,
    this.minite = "0",
    this.time = "0",
    required this.destination,
  }) : super(key: key);

  final String minite;
  final String time;
  final String destination;

  @override
  _BusCardState createState() => _BusCardState();
}

class _BusCardState extends State<BusCard> {
  List<dynamic> busData = [];
  bool _isExpanded = false;

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: InkWell(
              onTap: () => {print("test")},
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "X",
                          style: const TextStyle(fontSize: 70),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "aaa",
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              "分後",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.destination,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "行き",
                          style: TextStyle(fontSize: 20),
                        ),
                                        ],
                ),
              ],
            ),
          ),
        ),
      ),
      ExpansionTile(
        title: const Text(
          "Next",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        onExpansionChanged: (bool isExpanded) {
          setState(() {
            _isExpanded = isExpanded;
          });
        },
        initiallyExpanded: _isExpanded,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "XX:XX",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  "YY:YY",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  "ZZ:ZZ",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
);
  }}