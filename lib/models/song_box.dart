import 'package:flutter/material.dart';

class SongBox extends StatelessWidget {
  final Widget? child;
  const SongBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4, -4),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 300, // Set the desired width
        height: 300, // Set the desired height
        child: child,
      ),
      padding: const EdgeInsets.all(15),
    );
  }
}
