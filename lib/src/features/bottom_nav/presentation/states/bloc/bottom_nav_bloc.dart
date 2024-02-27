import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavInitial(tabIndex: 0)) {
    on<BottomNavEvent>(
      (event, emit) {
        if (event is TabChange) {
          emit(BottomNavInitial(tabIndex: event.changeTabEvent));
        }
      },
    );
  }
}
