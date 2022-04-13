import 'package:city_weather/logic/address/address_bloc.dart';
import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:city_weather/presentation/home_view.dart';
import 'package:city_weather/presentation/initial_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpalshView extends StatefulWidget {
  final int duration;


  const SpalshView({Key? key, required this.duration}) : super(key: key);

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
    goToNextView(widget.duration);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _controller.forward();
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.isDark ? Colors.black : Colors.white,
          body: FadeTransition(
            opacity: animation!,
            child: Center(
              child: Text(
                'City Weather',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                    fontSize: 40,
                  color: state.isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void goToNextView(duration) {
    Future.delayed(
      Duration(seconds: duration),
          () {
        String? myState = BlocProvider
            .of<AddressBloc>(context)
            .state
            .position;

        if (myState == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(
                  builder: (context) => const InitialAddressScreen()));
        } else {

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeView()));
        }
      },
    );
  }
}
