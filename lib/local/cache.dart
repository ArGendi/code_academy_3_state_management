import 'package:shared_preferences/shared_preferences.dart';

class Cache{
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveCounter(int counter) async{
    return await sharedPreferences.setInt('counter', counter);
  }

  static int? getCounter(){
    return sharedPreferences.getInt('counter');
  }
}