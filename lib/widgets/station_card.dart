import 'package:flutter/material.dart';
import '../models/station.dart';

class StationCard extends StatelessWidget {
  final Station station;
  final bool isCentered;
  final VoidCallback onTap;

  const StationCard({
    super.key,
    required this.station,
    required this.isCentered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (isCentered)
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 12,
                spreadRadius: 2,
              ),
          ],
          image: DecorationImage(
            image: AssetImage(station.thumbnail),
            fit: BoxFit.cover,
            colorFilter: isCentered
                ? null
                : ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.black54,
            child: Text(
              station.name,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
