import 'package:flutter/material.dart';
import 'package:zupay_store/core/utils/extensions.dart';

class CustomIconButton extends StatelessWidget {
  final ImageProvider iconImage;
  final VoidCallback? onClick;

  const CustomIconButton({
    Key? key,
    required this.iconImage,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClick,
      icon: Image(
        image: iconImage,
        fit: BoxFit.cover,
        width: 6.0.wp,
      ),
    );
  }
}
