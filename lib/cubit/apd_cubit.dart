import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spk3/cubit/apd_state.dart';
import 'package:spk3/shared/services/apd.dart';

class AlatPelindungDiriCubit extends Cubit<AlatPelindungDiriState> {
  final _alatPelindungDiriService = AlatPelindungDiriService();

  AlatPelindungDiriCubit() : super(AlatPelindungDiriInitial());

  Future<void> getAlatPelindungDiri() async {
    emit(AlatPelindungDiriLoading());

    try {
      final result = await _alatPelindungDiriService.getAlatPelindungDiri();

      emit(AlatPelindungDiriSuccess(result));
    } catch (e) {
      emit(AlatPelindungDiriFailed(e.toString()));
    }
  }
}
