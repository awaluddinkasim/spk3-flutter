class AlatPelindungDiri {
  String nama;
  String jenis;
  String spesifikasi;
  String standarKeamanan;

  AlatPelindungDiri({
    required this.nama,
    required this.jenis,
    required this.spesifikasi,
    required this.standarKeamanan,
  });

  factory AlatPelindungDiri.fromJson(Map<String, dynamic> json) {
    return AlatPelindungDiri(
      nama: json['nama'],
      jenis: json['jenis'],
      spesifikasi: json['spesifikasi'],
      standarKeamanan: json['standar_keamanan'],
    );
  }
}
