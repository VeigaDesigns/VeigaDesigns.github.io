import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

///Spotify Handler
class SpotifyHandler {
  ///Spotify ClientID
  static final String _clientID = dotenv.get("SPOTIFY_CLIENT_ID");

  ///Spotify Redirect URL
  static final String _redirectURL = dotenv.get("SPOTIFY_REDIRECT_URL");

  ///Authenticate with Spotify
  static Future<void> authenticate() async {
    //Connect to Spotify SDK
    await SpotifySdk.connectToSpotifyRemote(
      clientId: _clientID,
      redirectUrl: _redirectURL,
    ).then((connected) async {
      return connected;
    });
  }

  ///Get Access Token
  static Future<String> accessToken() async {
    final accessToken = await SpotifySdk.getAccessToken(
      clientId: _clientID,
      redirectUrl: _redirectURL,
      scope:
          "app-remote-control,user-modify-playback-state,playlist-read-private",
    );

    return accessToken;
  }
}
