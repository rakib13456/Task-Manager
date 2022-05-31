import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List <String> taskName=[];
List <String> setDate=[];

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}
  late  String day;
  late  String month;
  late  String year;
  late  String date;
  late String hour;
  late String minute;
TextEditingController taskController=TextEditingController();
DateTime now =DateTime.now();



class _DatePickerState extends State<DatePicker> {
  @override
  void initState() {
    // TODO: implement initState
    day=now.day.toString();
    month=now.month.toString();
    year=now.year.toString();
    date='$day/$month/$year';

    hour =now.hour.toString();
    minute=now.minute.toString();

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Add your Task',style: TextStyle(fontSize: 20),),
            SizedBox(height: 18,),
            TextField(
              controller: taskController,
              onTap: (){

              },
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 16,),
            OutlinedButton(
              onPressed: (){
                myDatePicker();
              }, child: Text('Date:'+date,style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 18,),
           // OutlinedButton(onPressed: (){}, child: child),

            MaterialButton(
              color: Colors.pink,
              onPressed: (){
                taskName.add(taskController.text.toString());
                taskController.clear();
                setDate.add(date);
                Navigator.pop(context);
              },
              child: Text('Click Button',style: TextStyle(fontSize: 18,color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
  void myDatePicker()async{
  DateTime datePicked= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime (2021), lastDate: DateTime(2099)) as DateTime;
    day=datePicked.day.toString();
    month=datePicked.month.toString();
    year=datePicked.year.toString();
    date='$day/$month/$year';
    setState(() {

    });
  }void myTimePicker(){
    showTimePicker(context: context, initialTime: initialTime)
  }
}
