import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
class CountProvider with ChangeNotifier{
  int _count=0;

  int get count => _count;

  void setCount(){
    _count++;
    notifyListeners();
  }

  String dateTime="";
  String get dt=>dateTime;

  void dateTimeFunction(){
    dateTime=DateTime.now().hour.toString()+":"+DateTime.now().minute.toString()+":"+DateTime.now().second.toString();
    notifyListeners();
  }
}