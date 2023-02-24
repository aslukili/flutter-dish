import 'dart:ui';

class Config {
  static final colors = _Color();
  static final assets = _Asset();
}

class _Color {
  final primaryColor = const Color(0xFFFFA451);
  final primaryTextColor = const Color(0xFF27214D);
  final accentTextColor = const Color(0xFF938DB5);
  final orangeColor = const Color(0xFFFFA451);
}

class _Asset {
  final splashImg = "assets/images/splash_img.png";
}
