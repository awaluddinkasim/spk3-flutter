import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk3/cubit/materi_state.dart';
import 'package:spk3/shared/services/materi.dart';

class MateriCubit extends Cubit<MateriState> {
  final _materiService = MateriEdukasiService();

  MateriCubit() : super(MateriInitial());

  Future<void> getMateri() async {
    emit(MateriLoading());

    try {
      final result = await _materiService.getMateriEdukasi();

      emit(MateriSuccess(result));
    } catch (e) {
      emit(MateriFailed(e.toString()));
    }
  }
}
