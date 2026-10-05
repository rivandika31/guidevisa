import 'package:flutter/material.dart';

import '../models/wallpaper.dart';

class DetailPage extends StatefulWidget {
  final Wallpaper wallpaper;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const DetailPage({
    super.key,
    required this.wallpaper,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool _fav = widget.isFavorite;

  @override
  Widget build(BuildContext context) {
    final wp = widget.wallpaper;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Gambar layar penuh
          Hero(
            tag: wp.id,
            child: Image.asset(
              wp.imageAsset,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.white10),
            ),
          ),

          // Gradasi bawah (IgnorePointer agar tidak menghalangi sentuhan)
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                    stops: const [0.6, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // Info & aksi
          Positioned(
            left: 24,
            right: 24,
            bottom: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wp.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  wp.category,
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          // TODO: pasang sebagai walpaper
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Fitur pasang walpaper segera hadir',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.download_rounded),
                        label: const Text('Pasang Walpaper'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(14),
                        icon: Icon(
                          _fav
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: _fav ? Colors.redAccent : Colors.white,
                        ),
                        onPressed: () {
                          widget.onFavorite();
                          setState(() => _fav = !_fav);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Tombol kembali: pojok kiri atas, diletakkan PALING AKHIR
          // supaya berada di lapisan teratas dan bisa diketuk
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
