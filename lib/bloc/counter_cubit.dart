import 'package:bloc/bloc.dart';
import 'package:code_academy_3/bloc/counter_states.dart';

class CounterCubit extends Cubit<CounterState>{
  int counter = 0;

  CounterCubit() : super(InitCounterState());

  void inc(){
    counter++;
    emit(IncrementCounterState());
  }

  void incThree(){
    counter+=3;
    emit(IncrementCounterState());
  }

  void dec(){
    counter--;
    emit(DecerementCounterState());
  }
}