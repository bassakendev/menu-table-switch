// This is the core component of the package, all the [menu_table_switch] logic is located here.
//The most important lines are all documented in order to improve everyone's understanding of the said structure,
// and attract more complete, relevant and robust contributions.

import 'package:flutter/material.dart';
import 'package:menu_table_switch/menu_table_switch_platform_interface.dart';

class MenuTableSwitch extends StatefulWidget {
  // Definition of menuItems: [[String menuTitle, Widget MenuContain]]
  final List<List<dynamic>>
      menuItems; //Exemple : [['title1', widget1],['title2', widget2],['title3', widget3]]

  final Color color;
  final Curve curve;
  final int durationInMilliseconds;
  final double height;
  final double width;

  const MenuTableSwitch({
    super.key,
    required this.menuItems,
    this.color = Colors.blue,
    this.curve = Curves.easeInOut,
    this.durationInMilliseconds = 500,
    this.height = 500,
    this.width = double.infinity,
  });

// The [getPlatformVersion] is used for integration testing.
//It is mainly called in the ../integration_test/plugin_integration_test.dart class.
  Future<String?> getPlatformVersion() {
    return MenuTableSwitchPlatform.instance.getPlatformVersion();
  }
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

  @override
  _MenuTableSwitchState createState() => _MenuTableSwitchState();
}

class _MenuTableSwitchState extends State<MenuTableSwitch> {
  late int selectedIndex; //Intial menu title selected
  List<Widget> widgets =
      []; //This variable will contain all the widgets extracted from the menuItems variable

  final PageController _controller = PageController();
  final ScrollController _listViewController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;

// widgets extractions from the menuItems variable
    for (var item in widget.menuItems) {
      widgets.add(item[1]);
    }
  }

//Scroll the title menu list with animation
  void scrollMenuTitle(int index) {
    _listViewController.animateTo(
      index * MediaQuery.of(context).size.width / 3 -
          MediaQuery.of(context).size.width / 3,
      duration: Duration(milliseconds: widget.durationInMilliseconds),
      curve: widget.curve,
    );
  }

//Detect scrolling to another menu
  void handleScrollMenuContain(int index) {
    _controller.jumpToPage(index);
    scrollMenuTitle(index);
  }

//Detect menu title change
  void handleChangeMenuTitle(int index) {
    setState(() {
      selectedIndex = index;
    });
    scrollMenuTitle(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: ListView.builder(
              controller: _listViewController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.menuItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    handleScrollMenuContain(index);
                  },
                  child: AnimatedContainer(
                    duration:
                        Duration(milliseconds: widget.durationInMilliseconds),
                    curve: widget.curve,
                    width: MediaQuery.of(context).size.width /
                        (widget.menuItems.length > 2
                            ? 3
                            : (widget.menuItems.isEmpty
                                ? 1
                                : widget.menuItems
                                    .length)), // Set the width of a title element
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.menuItems[index][0],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            selectedIndex == index ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
                controller: _controller,
                onPageChanged: (int index) {
                  handleChangeMenuTitle(index);
                },
                pageSnapping: true,
                children: widgets),
          ),
        ],
      ),
    );
  }

// It is recommended to free all resources in the dispose() method to avoid memory leaks,
// and ensure correct behavior when the widget is disposed. If you do not dispose of resources correctly,
// it can lead to performance and memory management issues in the long run.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
