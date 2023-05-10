import 'package:flutter/material.dart';
import 'package:flutter_advanced_seekbar/flutter_advanced_seekbar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

///Spotify Playlist
class SpotifyPlaylist extends StatefulWidget {
  const SpotifyPlaylist({super.key});

  @override
  State<SpotifyPlaylist> createState() => _SpotifyPlaylistState();
}

class _SpotifyPlaylistState extends State<SpotifyPlaylist> {
  //Handle Spotify

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: ListTile(
          leading: const Icon(Ionicons.play),
          title: AdvancedSeekBar(
            Theme.of(context).colorScheme.secondary,
            10,
            Theme.of(context).colorScheme.secondary,
            lineHeight: 2,
          ),
        ),
      ),
    );
  }
}
