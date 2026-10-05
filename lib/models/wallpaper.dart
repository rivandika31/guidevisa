class Wallpaper {
  final String id;
  final String title;
  final String category;

  const Wallpaper(this.id, this.title, this.category);

  String get imageAsset => 'assets/wallpapers/$id.jpg';
}

const List<String> categories = ['Semua', 'Alam', 'Abstrak', 'Kota', 'Gelap'];

const List<Wallpaper> wallpapers = [
  Wallpaper('alam1', 'Pegunungan Pagi', 'Alam'),
  Wallpaper('abstrak1', 'Warna Cair', 'Abstrak'),
  Wallpaper('kota1', 'Lampu Malam', 'Kota'),
  Wallpaper('gelap1', 'Ruang Hitam', 'Gelap'),
  Wallpaper('alam2', 'Hutan Berkabut', 'Alam'),
  Wallpaper('abstrak2', 'Gradasi Senja', 'Abstrak'),
  Wallpaper('kota2', 'Jalanan Sibuk', 'Kota'),
  Wallpaper('gelap2', 'Bayangan', 'Gelap'),
  Wallpaper('alam3', 'Pantai Tenang', 'Alam'),
  Wallpaper('abstrak3', 'Bentuk Neon', 'Abstrak'),
  Wallpaper('kota3', 'Gedung Tinggi', 'Kota'),
  Wallpaper('gelap3', 'Malam Sunyi', 'Gelap'),
];
