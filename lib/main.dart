import 'package:flutter/material.dart';
import 'package:task/Task.dart';



void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task',
    home: Task(),
    );
  }
}
