import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double radius;
  final String src;

  const CustomAvatar({
    super.key,
    required this.radius,
    required this.src,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: src.isNotEmpty
          ? NetworkImage(src)
          : const AssetImage(
              'assets/images/default-avatar.jpg',
            ),
      radius: radius,
    );
  }
}
