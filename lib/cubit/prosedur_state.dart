import 'package:equatable/equatable.dart';
import 'package:spk3/models/prosedur.dart';

class ProsedurState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProsedurInitial extends ProsedurState {}

class ProsedurLoading extends ProsedurState {}

class ProsedurSuccess extends ProsedurState {
  final List<ProsedurK3> daftarProsedur;

  ProsedurSuccess(this.daftarProsedur);

  @override
  List<Object> get props => [daftarProsedur];
}

class ProsedurFailed extends ProsedurState {
  final String message;

  ProsedurFailed(this.message);

  @override
  List<Object> get props => [message];
}
