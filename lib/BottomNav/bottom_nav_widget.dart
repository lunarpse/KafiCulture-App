import 'package:flutter/material.dart';

class BottonNavWidget extends StatelessWidget {
  const BottonNavWidget({
    super.key,
    @required this.onTap,
    @required this.data,
  });
  final void Function()? onTap;
  final IconData? data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 36,
        height: 36,
        child: Icon(
          data,
          color: Colors.white,
        ),
      ),
    );
  }
}
