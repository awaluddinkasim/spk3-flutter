import 'package:equatable/equatable.dart';
import 'package:spk3/models/materi.dart';

class MateriState extends Equatable {
  @override
  List<Object> get props => [];
}

class MateriInitial extends MateriState {}

class MateriLoading extends MateriState {}

class MateriSuccess extends MateriState {
  final List<MateriEdukasi> daftarMateri;

  MateriSuccess(this.daftarMateri);

  @override
  List<Object> get props => [daftarMateri];
}

class MateriFailed extends MateriState {
  final String message;

  MateriFailed(this.message);

  @override
  List<Object> get props => [message];
}
