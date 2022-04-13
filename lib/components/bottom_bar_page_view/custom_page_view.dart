import 'package:flutter/material.dart';
import 'animated_bottom_bar.dart';


// A custom page view with float bottom navigation bar
class CustomPageView extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(text: 'Home', icon: Icons.home, color: Colors.indigo),
    BarItem(
        text: 'Likes', icon: Icons.favorite_border, color: Colors.pinkAccent),
    BarItem(text: 'Search', icon: Icons.search, color: Colors.yellow.shade900),
    BarItem(text: 'Profile', icon: Icons.person_outline, color: Colors.teal)
  ];

  CustomPageView({Key? key}) : super(key: key);

  @override
  _CustomPageViewState createState() =>
      _CustomPageViewState();
}

class _CustomPageViewState
    extends State<CustomPageView> {
  int selectedBarIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (page){
            setState(() {
              selectedBarIndex = page;
            });
          },
          children: [
            Container(color: widget.barItems[selectedBarIndex].color,child: const Center(child: Text('0')),),
            Container(color: widget.barItems[selectedBarIndex].color,child: const Center(child: Text('1')),),
            Container(color: widget.barItems[selectedBarIndex].color,child: const Center(child: Text('2')),),
            Container(color: widget.barItems[selectedBarIndex].color,child: const Center(child: Text('3')),),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            margin: const EdgeInsets.all(8),
            child: AnimatedBottomBar(
                barItems: widget.barItems,
                animationDuration: const Duration(milliseconds: 100),
                barStyle: BarStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    iconSize: 30.0),
                onBarTab: (index) {
                  setState(() {
                    print(index);
                    selectedBarIndex = index;
                    // if(pageController.hasClients){
                      pageController.animateToPage(selectedBarIndex,duration: const Duration(milliseconds: 25),curve: Curves.easeInOut);
                    // }

                  });
                },
              controller: pageController,
              selectedBarIndex: selectedBarIndex,
                ),
          ),
        ),
      ],
    );
  }
}
