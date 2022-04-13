import 'package:city_weather/components/search_bar.dart';
import 'package:city_weather/logic/address/address_bloc.dart';
import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:city_weather/presentation/home_view.dart';
import 'package:city_weather/presentation/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialAddressScreen extends StatefulWidget {
  const InitialAddressScreen({Key? key}) : super(key: key);

  @override
  State<InitialAddressScreen> createState() => _InitialAddressScreenState();
}

class _InitialAddressScreenState extends State<InitialAddressScreen> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return Scaffold(
          backgroundColor: themeState.isDark ? Colors.black : Colors.white,
          resizeToAvoidBottomInset: false,
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Positioned(
                  child: AnimatedOpacity(
                    opacity: focused ? 0 : 1,
                    duration: const Duration(milliseconds: 100),
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: themeState.isDark
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontSize: 45),
                        ),
                        Text(
                          'Please Select your city',
                          style: TextStyle(
                            color:
                                themeState.isDark ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            fontSize: 35,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'or',
                          style: TextStyle(
                              color: themeState.isDark
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              fontSize: 25),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.gps_fixed,
                                  color: themeState.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: Text(
                                    'You can choose your current location by GPS',
                                    style: TextStyle(
                                        color: themeState.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2,
                                        fontSize: 20),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              BlocProvider.of<AddressBloc>(context)
                                  .add(GetAddress());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SpalshView(
                                    duration: 4,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  top: focused
                      ? 35
                      : MediaQuery.of(context).size.height / 2 - 47,
                  child: Column(
                    children: [
                      SearchBar(
                        onFocus: () {
                          setState(() {
                            focused = true;
                          });
                        },
                        onSubmit: (text) {
                          setState(() {
                            focused = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(
                                city: text,
                              ),
                            ),
                          );
                        },
                        onChange: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
