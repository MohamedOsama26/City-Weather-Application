import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const CurrentState(isDark: false)) {
    on<SetDarkTheme>((event, emit) {
      emit(const CurrentState(isDark: true));
    });

    on<SetLightTheme>((event, emit) {
      emit(const CurrentState(isDark: false));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return CurrentState(isDark: json['isDark']);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'isDark': state.isDark};
  }
}
