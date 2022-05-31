import 'package:flutter/material.dart';
import 'package:task_manager/datepicker_add.dart';
import 'package:task_manager/task_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
TextEditingController controller=TextEditingController();
List <String> task =[];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Task Manager'),
              centerTitle: true,
            ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: taskName.isEmpty?Center(child: Text('No Item\n Please Input Item'),):ListView.builder(itemBuilder: (context,index){
          return TaskItem(
            index: index,
            title:taskName[index],
          );
        },

          itemCount:taskName.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          
         await Navigator.push(context, MaterialPageRoute(builder: (contex) => DatePicker()));
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void MyDialog(){
    showDialog(context: context, builder: (contex){
      return AlertDialog(
        title: Text('Add Your Task'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(

            )
          ),
        ),
        actions: [
          TextButton(
              onPressed: (){
                task.add(controller.text);
                setState(() {
                  Navigator.pop(context);
                  controller.clear();
                });
              },
              child: Text('Ok')),
          TextButton(
              onPressed: (){
                controller.clear();
                Navigator.pop(context);
              },
              child: Text('cancel'))
        ],
      );
    });
  }
}
