part of 'theme_bloc.dart';

@immutable
abstract class ThemeState extends Equatable {
  final bool isDark;
  const ThemeState({required this.isDark});
}

class CurrentState extends ThemeState {
  const CurrentState({required bool isDark}) : super(isDark: isDark);

  @override
  List<Object?> get props => [isDark];
}
