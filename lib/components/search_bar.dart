import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key? key,
      required this.onFocus,
      required this.onSubmit,
      required this.onChange})
      : super(key: key);
  final Function onFocus;
  final Function onSubmit;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return Container(
          height: 48,
          width: MediaQuery.of(context).size.width - 30,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Color(0xFFC9C9C9),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            onChanged: (text) {
              onChange();
            },
            onTap: () {
              onFocus();
            },
            onFieldSubmitted: (text) {
              onSubmit(text);
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.black87,
            ),
            cursorColor: Colors.black87,
          ),
        );
      },
    );
  }
}
