import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage{

  Future<void> init()async{
    final directory = await  getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  Future<void> save({required String path,required String key,required String value})async{
    var box =await  Hive.openBox(path);
    debugPrint('save: $path, $key, $value');
    return box.put(key, value);
    
  }

  dynamic get({required String path,required String key})async {
    var box = await Hive.openBox(path);
    debugPrint('get: $path, $key');
    return box.get(key);
    
    
  }

  Future<void> delete({required String path,required String key})async{
    var box = await Hive.openBox(path);
    debugPrint('delete: $path, $key');
    return box.delete(key);
  }
}