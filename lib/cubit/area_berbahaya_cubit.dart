import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk3/cubit/area_berbahaya_state.dart';
import 'package:spk3/shared/services/area_berbahaya.dart';

class AreaBerbahayaCubit extends Cubit<AreaBerbahayaState> {
  final _areaBerbahayaService = AreaBerbahayaService();

  AreaBerbahayaCubit() : super(AreaBerbahayaInitial());

  Future<void> getAreaBerbahaya() async {
    emit(AreaBerbahayaLoading());

    try {
      final result = await _areaBerbahayaService.getAreaBerbahaya();

      emit(AreaBerbahayaSuccess(result));
    } catch (e) {
      emit(AreaBerbahayaFailed(e.toString()));
    }
  }
}
