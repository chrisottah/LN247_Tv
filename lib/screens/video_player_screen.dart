import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/services.dart';
import '../models/station.dart';

class VideoPlayerScreen extends StatefulWidget {
  final Station station;
  const VideoPlayerScreen({super.key, required this.station});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late BetterPlayerController _betterPlayerController;
  final Color brandColor = const Color(0xFFFFA722);

  @override
  void initState() {
    super.initState();

    // Configure the data source for live stream (m3u8)
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.station.streamUrl,
      liveStream: true,
      cacheConfiguration: const BetterPlayerCacheConfiguration(useCache: false),
      bufferingConfiguration: const BetterPlayerBufferingConfiguration(
        minBufferMs: 10000,
        maxBufferMs: 30000,
        bufferForPlaybackMs: 2500,
        bufferForPlaybackAfterRebufferMs: 5000,
      ),
    );

    // Initialize Better Player
    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        autoPlay: true,
        fullScreenByDefault: false,
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        allowedScreenSleep: false,
        autoDetectFullscreenDeviceOrientation: true,
        autoDetectFullscreenAspectRatio: true,
        expandToFill: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enablePlayPause: true,
          enableMute: true,
          enableFullscreen: true,
          enablePlaybackSpeed: false,
          controlBarColor: Colors.black54,
          iconsColor: Colors.white,
          loadingColor: Colors.orangeAccent,
        ),
      ),
      betterPlayerDataSource: dataSource,
    );

    // Hide system UI for immersive viewing
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: BetterPlayer(controller: _betterPlayerController),
          ),
          // Back button (top-left)
          Positioned(
            top: 40,
            left: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.black54,
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          // Exit button (top-right)
          Positioned(
            top: 40,
            right: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: brandColor,
              onPressed: () => SystemNavigator.pop(),
              child: const Icon(Icons.exit_to_app, color: Colors.white),
            ),
          ),
          // Station name overlay (center-top)
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                widget.station.name,
                style: TextStyle(
                  color: brandColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: const [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 4,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
