import 'package:spk3/models/materi.dart';
import 'package:spk3/shared/utils/dio.dart';

class MateriEdukasiService {
  Future<List<MateriEdukasi>> getMateriEdukasi() async {
    final response = await Request.get('/materi');

    List<MateriEdukasi> data = [];

    for (var item in response['daftarMateriEdukasi']) {
      data.add(MateriEdukasi.fromJson(item));
    }

    return data;
  }
}
