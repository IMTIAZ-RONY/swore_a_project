import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const ActionButton({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      heroTag: icon.toString(),
      backgroundColor: Colors.teal,
      child: Icon(icon, size: 28, color: Colors.white),
    );
  }
}
