import 'package:flutter/material.dart';

class BarItem {
  final String text;
  final IconData icon;
  final double iconSize, textSize;
  final Color color;

  BarItem({required this.text, required this.icon, required this.color, this.iconSize=24, required this.textSize});
}