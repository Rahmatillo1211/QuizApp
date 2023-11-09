import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  final String title;
  final Color titlecolor;
  final Color cardColor;
  final VoidCallback onPressed;
  final String imagePath;
  const CardItemWidget(
      {super.key,
      required this.title,
      required this.titlecolor,
      required this.cardColor,
      required this.imagePath,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: titlecolor,
              ),
            ),
            Image.asset(
              imagePath,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
