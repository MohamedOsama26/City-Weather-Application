import 'package:city_weather/components/bottom_bar_page_view/custom_page_view.dart';
import 'package:flutter/material.dart';

class SpalshView extends StatefulWidget {
  const SpalshView({Key? key}) : super(key: key);

  @override
  State<SpalshView> createState() => _SpalshViewState();
}

class _SpalshViewState extends State<SpalshView>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0.3, end: 1.0).animate(controller!);
    controller?.repeat(reverse: true);
    goToNextView();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _controller.forward();
    return FadeTransition(
      opacity: animation!,
      child: const Center(
        child: Text(
          'City Weather',
          style: TextStyle(
              fontFamily: 'Yanone Kaffeesatz',
              fontWeight: FontWeight.w300,
              letterSpacing: 2,
              fontSize: 40),
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  CustomPageView()));
      },
    );
  }
}
