import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: state.isDark ? Colors.black : Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: state.isDark ? Colors.white : Colors.black,
                            size: 17,
                          ),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        child: Text(
                          'Settings',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: state.isDark ? Colors.white : Colors.black,
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 44,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Theme',
                          style: TextStyle(
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 26),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Light Theme',
                                      // textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: state.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2,
                                          fontSize: 22),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Let There be Light!',
                                      style: TextStyle(
                                          color: state.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.check, color: Colors.black),
                          ],
                        ),
                        onTap: () {
                          BlocProvider.of<ThemeBloc>(context)
                              .add(SetLightTheme());
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Dark Theme',
                                      style: TextStyle(
                                          color: state.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2,
                                          fontSize: 22),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Join the Dark Side!',
                                      // textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: state.isDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.check, color: Colors.white),
                          ],
                        ),
                        onTap: () {
                          BlocProvider.of<ThemeBloc>(context)
                              .add(SetDarkTheme());
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 44,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Feedback',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 26),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Report an Issue',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 22),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Facing an issue? Report and we'll look into it.",
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Rate on Play Store',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 22),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enjoying the app? Leave a review on the Play Store',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'About',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 26),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'About City Weather',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 22),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Facing an issue? Report and we'll look into it.",
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                              fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
