import 'package:spk3/models/area_berbahaya.dart';
import 'package:spk3/shared/utils/dio.dart';

class AreaBerbahayaService {
  Future<List<AreaBerbahaya>> getAreaBerbahaya() async {
    final response = await Request.get('/area-berbahaya');

    List<AreaBerbahaya> data = [];

    for (var item in response['daftarAreaBerbahaya']) {
      data.add(AreaBerbahaya.fromJson(item));
    }

    return data;
  }
}
