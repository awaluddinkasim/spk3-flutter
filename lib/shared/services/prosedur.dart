import 'package:spk3/models/prosedur.dart';
import 'package:spk3/shared/utils/dio.dart';

class ProsedurK3Service {
  Future<List<ProsedurK3>> getProsedurK3() async {
    final response = await Request.get('/prosedur');

    List<ProsedurK3> data = [];

    for (var item in response['daftarProsedurK3']) {
      data.add(ProsedurK3.fromJson(item));
    }

    return data;
  }
}
