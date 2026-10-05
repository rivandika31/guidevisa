import 'package:flutter/material.dart';

import '../models/wallpaper.dart';

class WallpaperCard extends StatelessWidget {
  final Wallpaper wallpaper;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  const WallpaperCard({
    super.key,
    required this.wallpaper,
    required this.isFavorite,
    required this.onTap,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: wallpaper.id,
        child: Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  wallpaper.imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.white10,
                    child: const Icon(Icons.broken_image_rounded,
                        color: Colors.white38, size: 36),
                  ),
                ),

                // Gradasi gelap di bawah untuk teks
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.75),
                        ],
                        stops: const [0.55, 1.0],
                      ),
                    ),
                  ),
                ),

                // Tombol favorit
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: onFavorite,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.35),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFavorite
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 20,
                        color: isFavorite ? Colors.redAccent : Colors.white,
                      ),
                    ),
                  ),
                ),

                // Judul
                Positioned(
                  left: 14,
                  right: 14,
                  bottom: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wallpaper.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        wallpaper.category,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
