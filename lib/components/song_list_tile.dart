import 'package:flutter/material.dart';

class SongListTile extends StatelessWidget {
  final String songTile;
  final Icon icon;
  final void Function()? onTap;

  const SongListTile({
    super.key,
    required this.songTile,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 10),
      child: ListTile(
        leading: icon,
        title: Text(songTile),
        onTap: onTap,
      ),
    );
  }
}
