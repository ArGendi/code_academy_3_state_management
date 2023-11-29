import 'package:code_academy_3/local/cache.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int counter = 0;

  void inc(){
    counter++;
    Cache.saveCounter(counter);
    notifyListeners();
  }

  void inc3(){
    counter += 3;
    Cache.saveCounter(counter);
    notifyListeners();
  }

  void getCounter(){
    int? data = Cache.getCounter();
    if(data != null){
      counter = data;
    }
  }
}