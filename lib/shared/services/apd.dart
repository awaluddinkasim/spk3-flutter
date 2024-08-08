import 'package:spk3/models/apd.dart';
import 'package:spk3/shared/utils/dio.dart';

class AlatPelindungDiriService {
  Future<List<AlatPelindungDiri>> getAlatPelindungDiri() async {
    final response = await Request.get('/apd');

    List<AlatPelindungDiri> data = [];

    for (var item in response['daftarAlatPelindungDiri']) {
      data.add(AlatPelindungDiri.fromJson(item));
    }

    return data;
  }
}
