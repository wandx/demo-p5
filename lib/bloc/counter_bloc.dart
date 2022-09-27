import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Tambah>((event, emit) {
      emit(CounterLoading());
      _nilai = _nilai + 1;
      emit(CounterLoaded(_nilai));
    });

    on<Kurang>((event, emit) async {
      emit(CounterLoading());
      await Future.delayed(Duration(seconds: 2));
      _nilai = _nilai - 1;
      emit(CounterLoaded(_nilai));
    });
  }

  int _nilai = 0;
}
