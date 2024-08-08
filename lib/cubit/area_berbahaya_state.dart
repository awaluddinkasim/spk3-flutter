import 'package:equatable/equatable.dart';
import 'package:spk3/models/area_berbahaya.dart';

class AreaBerbahayaState extends Equatable {
  @override
  List<Object> get props => [];
}

class AreaBerbahayaInitial extends AreaBerbahayaState {}

class AreaBerbahayaLoading extends AreaBerbahayaState {}

class AreaBerbahayaSuccess extends AreaBerbahayaState {
  final List<AreaBerbahaya> daftarAreaBerbahaya;

  AreaBerbahayaSuccess(this.daftarAreaBerbahaya);

  @override
  List<Object> get props => [daftarAreaBerbahaya];
}

class AreaBerbahayaFailed extends AreaBerbahayaState {
  final String message;

  AreaBerbahayaFailed(this.message);

  @override
  List<Object> get props => [message];
}
