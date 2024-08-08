import 'package:equatable/equatable.dart';
import 'package:spk3/models/apd.dart';

class AlatPelindungDiriState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlatPelindungDiriInitial extends AlatPelindungDiriState {}

class AlatPelindungDiriLoading extends AlatPelindungDiriState {}

class AlatPelindungDiriSuccess extends AlatPelindungDiriState {
  final List<AlatPelindungDiri> daftarAlatPelindungDiri;

  AlatPelindungDiriSuccess(this.daftarAlatPelindungDiri);

  @override
  List<Object> get props => [daftarAlatPelindungDiri];
}

class AlatPelindungDiriFailed extends AlatPelindungDiriState {
  final String message;

  AlatPelindungDiriFailed(this.message);

  @override
  List<Object> get props => [message];
}
