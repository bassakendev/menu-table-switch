# menu_table_switch

###### About :
This is a flutter package that allows you to display the menu in the form of a horizontally scrolling table.

## Getting Started

This package mainly has no requirements, and is suitable for all flutter platforms.

<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Features

**Menu table switch demo**

![Demo of menu_table_switch package](https://github.com/bassakendev/menu-table-switch/assets/131482899/93a2126c-6da4-4356-be78-53f57d61be7b)

## Usage

You can find a more complete example in to `/example/lib/main.dart` folder.

```dart
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
        titles: const [], // Type List<String>. The size of the titles parameter must be equal to the size of the number of children in the children parameter

        children: [], //The display order of the children of the children parameter must be the same as that of the title parameter, to display exactly the content corresponding to the title.
      ),
    );
  }
}

```

## Additional information

If you encounter any problems with the package, do not hesitate to send an email to bassakendev@gmail.com. If you wish to contribute to the package for improvements and other purposes, you can fork the package, your pull request will be examined and the result will be communicated to you by the email you left.
