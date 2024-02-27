part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

final class TabChange extends BottomNavEvent {
  final int changeTabEvent;

  TabChange({required this.changeTabEvent});
}
