class ProsedurK3 {
  String judul;
  String deskripsi;
  String prosedur;

  ProsedurK3({
    required this.judul,
    required this.deskripsi,
    required this.prosedur,
  });

  factory ProsedurK3.fromJson(Map<String, dynamic> json) {
    return ProsedurK3(
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      prosedur: json['prosedur'],
    );
  }
}
