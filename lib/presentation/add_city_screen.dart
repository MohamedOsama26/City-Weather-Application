import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCityScreen extends StatelessWidget {
  const AddCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.isDark ? Colors.black : Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
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
                            'Add New Location',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color:
                                    state.isDark ? Colors.white : Colors.black,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: state.isDark
                          ? Colors.white
                          : Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.black87,
                      ),
                      cursorColor: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: state.isDark
                                          ? Colors.white
                                          : Colors.black,
                                      letterSpacing: 1),
                                ),
                                Text(
                                  'Region',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: state.isDark
                                          ? Colors.white
                                          : Colors.black,
                                      letterSpacing: 1),
                                ),
                                Text(
                                  'Country',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: state.isDark
                                          ? Colors.white
                                          : Colors.black,
                                      letterSpacing: 2),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.add,
                            color: state.isDark ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
