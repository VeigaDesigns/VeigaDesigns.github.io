import 'package:flutter/material.dart';
import 'package:flutter_advanced_seekbar/flutter_advanced_seekbar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:veiga/util/data/spotify/handler.dart';

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
    String currentSong = "Not Playing";

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: StreamBuilder(
        stream: SpotifyHandler.player(),
        builder: (context, snapshot) {
          //Player
          final player = snapshot.data;

          return Card(
            child: ListTile(
              leading: IconButton(
                icon: const Icon(Ionicons.play),
                onPressed: () {
                  setState(() {
                    if (player != null) {
                      currentSong = player.title;
                    } else {
                      currentSong = "Not Playing";
                    }
                  });
                },
              ),
              title: Text(currentSong),
              subtitle: AdvancedSeekBar(
                Theme.of(context).colorScheme.secondary,
                10,
                Theme.of(context).colorScheme.secondary,
                lineHeight: 2,
              ),
            ),
          );
        },
      ),
    );
  }
}
