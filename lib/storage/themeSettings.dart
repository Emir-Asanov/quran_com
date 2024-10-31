import 'package:flutter/material.dart';

class AppTheme {
  final Color colorOne;
  final Color colorTwo;
  final Color colorThree;
  final Color colorFour;
  final Color colorFive;

  AppTheme({
    this.colorOne = const Color.fromRGBO(86, 153, 150, 1),
    this.colorTwo = const Color.fromRGBO(142, 186, 182, 1),
    this.colorThree = const Color.fromRGBO(180, 216, 206, 1),
    this.colorFour = const Color.fromRGBO(255, 255, 255, 1),
    this.colorFive = const Color.fromRGBO(13, 17, 29, 1),
  });
}

final classicTheme = AppTheme(
  colorFive: const Color.fromRGBO(13, 17, 29, 1),
  colorFour: const Color.fromRGBO(255, 255, 255, 1),
  colorThree: const Color.fromRGBO(180, 216, 206, 1),
  colorTwo: const Color.fromRGBO(142, 186, 182, 1),
  colorOne: const Color.fromRGBO(86, 153, 150, 1),
);

final darkTheme = AppTheme(
  colorFive: const Color.fromARGB(255, 78, 59, 137),
  colorFour: const Color.fromRGBO(13, 25, 41, 1),
  colorThree: const Color.fromRGBO(135, 141, 153, 1),
  colorTwo: const Color.fromARGB(255, 187, 19, 162),
  colorOne: const Color.fromRGBO(13, 17, 29, 1),
);
