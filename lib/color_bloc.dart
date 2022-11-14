import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { eventPurple, eventBlack }

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.purple) {
    on<ColorEvent>((event, emit) {
      return (event == ColorEvent.eventPurple)
          ? emit(Colors.purple)
          : emit(Colors.black);
    });
  }
}
