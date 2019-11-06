import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  final Image image;
  final String title;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({this.image, this.title, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          child: Material(
              child: InkWell(
            child: image,
            onTap: onTap,
          )),
          tag: 'img'),
    );
  }
}
