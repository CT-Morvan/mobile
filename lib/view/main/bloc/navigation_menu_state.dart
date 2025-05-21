part of 'navigation_menu_bloc.dart';

@immutable
sealed class NavigationMenuState {}

final class NavigationMenuStateInitial extends NavigationMenuState {}

final class NavigationMenuStateError extends NavigationMenuState {
  final String message;

  NavigationMenuStateError({required this.message});
}

final class NavigationMenuStateSuccess extends NavigationMenuState {
  final UserModel user;
  NavigationMenuStateSuccess({required this.user});
}
