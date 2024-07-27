import 'package:flutter/material.dart';
import 'package:music_player/components/song_list_tile.dart';

import 'package:music_player/screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
              ),
            ),
          ),
          SongListTile(
            songTile: "Home",
            icon: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          SongListTile(
            songTile: "Settings",
            icon: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
