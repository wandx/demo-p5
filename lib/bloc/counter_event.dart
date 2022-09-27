part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  List<Object?> get props => throw UnimplementedError();
}

class Tambah extends CounterEvent {}

class Kurang extends CounterEvent {}
