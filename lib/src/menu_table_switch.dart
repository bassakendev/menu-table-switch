// This is the core component of the package, all the [menu_table_switch] logic is located here.
//The most important lines are all documented in order to improve everyone's understanding of the said structure,
// and attract more complete, relevant and robust contributions.

import 'package:flutter/material.dart';

class MenuTableSwitch extends StatefulWidget {
  final Color hoverColor;
  final Color color;
  final Curve curve;
  final int durationInMilliseconds;
  final double height;
  final double width;
  final List<String> titles;
  final List<Widget> children;

  const MenuTableSwitch({
    super.key,
    this.hoverColor = Colors.blue,
    this.color = Colors.black,
    this.curve = Curves.easeInOut,
    this.durationInMilliseconds = 500,
    this.height = 500,
    this.width = double.infinity,
    required this.titles,
    required this.children,
  });

  @override
  _MenuTableSwitchState createState() => _MenuTableSwitchState();
}

class _MenuTableSwitchState extends State<MenuTableSwitch> {
  late int selectedIndex; //Intial menu title selected

  final PageController _controller = PageController();
  final ScrollController _listViewController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
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
              itemCount: widget.titles.length,
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
                        (widget.titles.length > 2
                            ? 3
                            : (widget.titles.isEmpty
                                ? 1
                                : widget.titles
                                    .length)), // adapt the width of a title element, depending of titles length
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: selectedIndex == index
                              ? widget.hoverColor
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.titles[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: selectedIndex == index
                            ? widget.hoverColor
                            : widget.color,
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
                children: widget.children),
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
