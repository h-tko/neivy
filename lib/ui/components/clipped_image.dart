import 'package:flutter/material.dart';

class ClippedImage {
  static Widget build(Image image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: image,
    );
  }
}
