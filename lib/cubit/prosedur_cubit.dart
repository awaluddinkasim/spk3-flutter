import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk3/cubit/prosedur_state.dart';
import 'package:spk3/shared/services/prosedur.dart';

class ProsedurCubit extends Cubit<ProsedurState> {
  final _prosedurService = ProsedurK3Service();

  ProsedurCubit() : super(ProsedurInitial());

  Future<void> getProsedur() async {
    emit(ProsedurLoading());

    try {
      final result = await _prosedurService.getProsedurK3();

      emit(ProsedurSuccess(result));
    } catch (e) {
      emit(ProsedurFailed(e.toString()));
    }
  }
}
