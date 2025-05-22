import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  const GlassContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.2),
        boxShadow: [
          BoxShadow(color: Colors.white24, blurRadius: 10, offset: Offset(4, 4)),
        ],
        border: Border.all(color: Colors.white70, width: 3),
      ),
      child: child,
    );
  }
}
