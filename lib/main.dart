import 'package:flutter/material.dart';
//import 'package:task_manager/home_page.dart';
import 'package:task_manager/person_profile.dart';

main(){
  runApp(MyTask());
}
class MyTask extends StatelessWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: HomePage(),

    );
  }
}


