import 'package:flutter/material.dart';
import '../models/station.dart';
import 'video_player_screen.dart';

class SelectStationScreen extends StatefulWidget {
  const SelectStationScreen({super.key});

  @override
  State<SelectStationScreen> createState() => _SelectStationScreenState();
}

class _SelectStationScreenState extends State<SelectStationScreen> {
  final List<Station> stations = [
    Station(
      name: "LN247 International",
      streamUrl: "https://zkpywpwalbeg-hls-live.5centscdn.com/LN247news/7f46165474d11ee5836777d85df2cdab.sdp/playlist.m3u8",
      thumbnail: 'assets/thumbnails/station1_thumbnail.jpeg',
    ),
    Station(
      name: "LN247 Lagos",
      streamUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream2/playlist.m3u8",
      thumbnail: 'assets/thumbnails/station2_thumbnail.jpeg',
    ),
    Station(
      name: "LN247 Abuja",
      streamUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream3/playlist.m3u8",
      thumbnail: 'assets/thumbnails/station3_thumbnail.jpeg',
    ),
    Station(
      name: "LN247 Africa",
      streamUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream4/playlist.m3u8",
      thumbnail: 'assets/thumbnails/station4_thumbnail.jpeg',
    ),
    Station(
      name: "LN247 Portharcourt",
      streamUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream5/playlist.m3u8",
      thumbnail: 'assets/thumbnails/station5_thumbnail.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Select Station To Watch",
          style: TextStyle(color: Colors.white), // white text for visibility
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isLargeScreen ? 3 : 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 16 / 9,
        ),
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final station = stations[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => VideoPlayerScreen(station: station)));
            },
            child: StaticThumbnailTile(station: station),
          );
        },
      ),
    );
  }
}

class StaticThumbnailTile extends StatelessWidget {
  final Station station;
  const StaticThumbnailTile({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(station.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black54,
            child: Text(
              station.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
