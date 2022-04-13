import 'package:flutter/material.dart';

// This component is animated bottom navigation bar.
// It receives list of elements for buttons, duration of animation,
// function which happened with touch and the style of font and icon.
class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTab;
  final BarStyle barStyle;
  final PageController controller;
  int selectedBarIndex;

   AnimatedBottomBar(
      {Key? key,
      required this.barItems,
      this.animationDuration = const Duration(milliseconds: 500),
      required this.onBarTab,
      required this.barStyle,
      required this.controller,
      required this.selectedBarIndex})
      : super(key: key);

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  // int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      ),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 20.0, top: 20.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> buildBarItems() {
    List<Widget> _barItems = [];
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = widget.selectedBarIndex == i;
      _barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            widget.selectedBarIndex = i;
            print(i);
            widget.onBarTab(widget.selectedBarIndex);
            // if(widget.controller.hasClients){
            //   widget.controller.jumpToPage(i);
            // }
          });
        },
        child: AnimatedContainer(
          duration: widget.animationDuration,
          decoration: BoxDecoration(
              color:
                  isSelected ? item.color.withOpacity(0.4) : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  color: isSelected ? item.color : Colors.black,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                AnimatedSize(
                  duration: widget.animationDuration,
                  curve: Curves.easeInOut,
                  child: Text(
                    isSelected ? item.text : '',
                    style: TextStyle(
                        color: item.color,
                        fontWeight: widget.barStyle.fontWeight,
                        fontSize: widget.barStyle.fontSize),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }
    return _barItems;
  }
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;

  BarStyle({
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w600,
    this.iconSize = 32.0,
  });
}

class BarItem {
  String text;
  IconData icon;
  Color color;

  BarItem({
    required this.text,
    required this.icon,
    required this.color,
  });
}
