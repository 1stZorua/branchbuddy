import "package:flutter/material.dart";

// Converts given hex code to a Color widget
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}