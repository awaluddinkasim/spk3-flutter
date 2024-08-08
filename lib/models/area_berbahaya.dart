class AreaBerbahaya {
  String lokasi;
  String deskripsi;
  String gambar;
  String tingkatBahaya;

  AreaBerbahaya({
    required this.lokasi,
    required this.deskripsi,
    required this.gambar,
    required this.tingkatBahaya,
  });

  factory AreaBerbahaya.fromJson(Map<String, dynamic> json) {
    return AreaBerbahaya(
      lokasi: json['lokasi'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      tingkatBahaya: json['tingkat_bahaya'],
    );
  }
}
