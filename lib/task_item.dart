import 'dart:math';

import 'package:flutter/material.dart';

import 'datepicker_add.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
   required this.index,
  required  this.title,
    Key? key}) : super(key: key);
  final int index;
  final String title;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  List <Color> color =[
    Colors.cyan,
    Colors.indigo,
    Colors.red,
    Colors.pink,
    Colors.amber,
    Colors.deepOrangeAccent,
    Colors.purple,
    Colors.green,
    Colors.yellow,
    Colors.pink
  ];

  bool isCheck=false;
  Random random=Random();



  @override
  Widget build(BuildContext context) {
    int num=random.nextInt(10);
    return ListTile(
      title:Text('${widget.title.toString()}',style: TextStyle(decoration:isCheck? TextDecoration.lineThrough:TextDecoration.none),),
      subtitle: Text('Date:'+setDate[widget.index]),

      trailing: GestureDetector(
        onTap: (){
          isCheck=!isCheck;
          setState(() {

          });
        },
          child: Icon(isCheck ? Icons.check_box:Icons.check_box_outline_blank)),
      leading: CircleAvatar(
        backgroundColor: color[num],
        child: Text('${widget.index+1}'),
      ),
    );
  }
}
