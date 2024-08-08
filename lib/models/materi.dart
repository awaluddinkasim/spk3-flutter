class MateriEdukasi {
  String judul;
  String materi;
  DateTime tglDibuat;

  MateriEdukasi({
    required this.judul,
    required this.materi,
    required this.tglDibuat,
  });

  factory MateriEdukasi.fromJson(Map<String, dynamic> json) {
    return MateriEdukasi(
      judul: json['judul'],
      materi: json['materi'],
      tglDibuat: DateTime.parse(json['tgl_dibuat']),
    );
  }
}
