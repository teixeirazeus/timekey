import 'package:flutter/material.dart';
import 'package:timekey/key_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<KeyTile> keys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(children: keys),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            keys.add(KeyTile(
              name: 'Key ${keys.length + 1}',
              secretKey: 'JBSWY3DPEHPK3PXP',
            ));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
