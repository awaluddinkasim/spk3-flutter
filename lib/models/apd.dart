class AlatPelindungDiri {
  String nama;
  String jenis;
  String spesifikasi;
  String standarKeamanan;
  String gambar;

  AlatPelindungDiri({
    required this.nama,
    required this.jenis,
    required this.spesifikasi,
    required this.standarKeamanan,
    required this.gambar,
  });

  factory AlatPelindungDiri.fromJson(Map<String, dynamic> json) {
    return AlatPelindungDiri(
      nama: json['nama'],
      jenis: json['jenis'],
      spesifikasi: json['spesifikasi'],
      standarKeamanan: json['standar_keamanan'],
      gambar: json['gambar'],
    );
  }
}
