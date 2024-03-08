import 'package:flutter/material.dart';
import 'package:menu_table_switch/menu_table_switch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text(
            'Menu table switch demo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )),
        body: MenuTableSwitch(
          menuItems: menus,
        ),
      ),
    );
  }
}

List<List<dynamic>> menus = [
  [
    'Pink',
    Container(
      color: Colors.pink,
      child: const Center(
          child: Text(
        'Pink',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        textAlign: TextAlign.center,
      )),
    )
  ],
  [
    'menu B',
    Container(
      color: Colors.black,
      child: const Center(
          child: Text(
        'Black',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        textAlign: TextAlign.center,
      )),
    )
  ],
  [
    'Orange',
    Container(
      color: Colors.orange,
      child: const Center(
          child: Text(
        'Orange',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        textAlign: TextAlign.center,
      )),
    )
  ],
  [
    'Green',
    Container(
      color: Colors.green,
      child: const Center(
          child: Text(
        'Green',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        textAlign: TextAlign.center,
      )),
    )
  ],
  [
    'Yellow',
    Container(
      color: Colors.yellow,
      child: const Center(
          child: Text(
        'Yellow',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        textAlign: TextAlign.center,
      )),
    )
  ],
  [
    'Brown',
    Container(
      color: Colors.brown,
      child: const Center(
          child: Text(
        'Brown',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        textAlign: TextAlign.center,
      )),
    )
  ],
];
