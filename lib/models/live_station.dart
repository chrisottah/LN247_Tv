class LiveStation {
  final String name;
  final String imageUrl;
  final String streamUrl;

  LiveStation({
    required this.name,
    required this.imageUrl,
    required this.streamUrl,
  });
}

final List<LiveStation> stations = [
  LiveStation(
    name: "LN247 International",
    imageUrl: "https://zkpywpwalbeg-hls-live.5centscdn.com/LN247news/7f46165474d11ee5836777d85df2cdab.sdp/thumbnail.jpg",
    streamUrl: "https://zkpywpwalbeg-hls-live.5centscdn.com/LN247news/7f46165474d11ee5836777d85df2cdab.sdp/playlist.m3u8",
  ),
  LiveStation(
    name: "LN247 Lagos",
    imageUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream2/thumbnail.jpg",
    streamUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream2/playlist.m3u8",
  ),
  LiveStation(
    name: "LN247 Abuja",
    imageUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream3/thumbnail.jpg",
    streamUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream3/playlist.m3u8",
  ),
  LiveStation(
    name: "LN247 Africa",
    imageUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream4/thumbnail.jpg",
    streamUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream4/playlist.m3u8",
  ),
  LiveStation(
    name: "LN247 Portharcourt",
    imageUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream5/thumbnail.jpg",
    streamUrl: "https://cdn-out1-los1.internetmultimediaonline.org/ln247/stream5/playlist.m3u8",
  ),
];
