import 'package:flutter/material.dart';
import 'package:menu_table_switch/menu_table_switch.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text(
          'Menu table switch demo',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      )),
      body: MenuTableSwitch(
        titles: const ['Pink', 'Black', 'Orange', 'Green', 'yellow', 'Brown'],
        children: [
          Container(
            color: Colors.pink,
            child: const Center(
                child: Text(
              'Pink',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
          ),
          Container(
            color: Colors.black,
            child: const Center(
                child: Text(
              'Black',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
          ),
          Container(
            color: Colors.orange,
            child: const Center(
                child: Text(
              'Orange',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
          ),
          Container(
            color: Colors.green,
            child: const Center(
                child: Text(
              'Green',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
                child: Text(
              'Yellow',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
          ),
          Container(
            color: Colors.brown,
            child: const Center(
                child: Text(
              'Brown',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
          )
        ],
      ),
    );
  }
}
