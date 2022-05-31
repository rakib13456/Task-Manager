


import 'package:flutter/material.dart';
import 'package:task_manager/questions.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/images/q3_mohiuddin.jpg',
    'assets/images/q2_hamidur.jpg',
    'assets/images/q5_ruhul.jpg',
    'assets/images/q4_motiur.png',
  ];

  int index = 0;
  Color listTileBgColorA = Colors.white;
  Color listTileBgColorB = Colors.white;
  Color listTileBgColorC = Colors.white;
  Color listTileBgColorD = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(),
        color: Colors.blueAccent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${index+1}/${images.length} \nQuestions',
                  textAlign: TextAlign.center,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: ClipOval(
                    child: Image.asset(images[index], fit: BoxFit.fill, ),
                  ),
                ),
                const Text(
                  '0 \nScore',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Guess who is this?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 16,
            ),
            BuildListTile(
              listTileBgColor: listTileBgColorA,
              serial: 'A',
              option: questions[index].opt1,
              trail: Icon(null),
              onOptionPress: (){
                if(questions[index].ans == 'a'){
                  listTileBgColorA = Colors.green;
                  listTileBgColorB = Colors.white;
                  listTileBgColorC = Colors.white;
                  listTileBgColorD = Colors.white;
                  print('right ans');


                }else{
                  listTileBgColorA = Colors.red;
                  listTileBgColorB = Colors.white;
                  listTileBgColorC = Colors.white;
                  listTileBgColorD = Colors.white;
                }
                setState(() {

                });
              },
            ),
            const SizedBox(height: 16,),
            BuildListTile(
              listTileBgColor: listTileBgColorB,
              serial: 'B',
              option: questions[index].opt2,
              trail: Icon(null), onOptionPress: () {
              if(questions[index].ans == 'b'){
                listTileBgColorB = Colors.green;
                listTileBgColorA = Colors.white;
                listTileBgColorC = Colors.white;
                listTileBgColorD = Colors.white;
                print('right ans');


              }else{
                listTileBgColorB = Colors.red;
                listTileBgColorA = Colors.white;
                listTileBgColorC = Colors.white;
                listTileBgColorD = Colors.white;
              }
              setState(() {

              });
            },
            ),
            const SizedBox(height: 16,),
            BuildListTile(
              listTileBgColor: listTileBgColorC,
              serial: 'C',
              option: questions[index].opt3,
              trail: Icon(null), onOptionPress: () {
              if(questions[index].ans == 'c'){
                listTileBgColorC = Colors.green;
                listTileBgColorB = Colors.white;
                listTileBgColorA = Colors.white;
                listTileBgColorD = Colors.white;
                print('right ans');


              }else{
                listTileBgColorC = Colors.red;
                listTileBgColorB = Colors.white;
                listTileBgColorA = Colors.white;
                listTileBgColorD = Colors.white;
              }
              setState(() {

              });
            },
            ),
            const SizedBox(height: 16,),
            BuildListTile(
              listTileBgColor: listTileBgColorD,
              serial: 'D',
              option: questions[index].opt4,
              trail: Icon(null), onOptionPress: () {
              if(questions[index].ans == 'd'){
                listTileBgColorD = Colors.green;
                listTileBgColorB = Colors.white;
                listTileBgColorC = Colors.white;
                listTileBgColorA = Colors.white;
                print('right ans');


              }else{
                listTileBgColorD = Colors.red;
                listTileBgColorB = Colors.white;
                listTileBgColorC = Colors.white;
                listTileBgColorA = Colors.white;
              }
              setState(() {

              });
            },
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    shape: StadiumBorder(),
                    color: Colors.green,
                    onPressed: (){
                      if(index > 0){
                        index--;
                      }else{
                        index=images.length-1;
                      }
                      setState(() {

                      });
                    }, child: const Text('Previous', style: TextStyle(color: Colors.white),)),
                MaterialButton(
                    shape: StadiumBorder(),
                    color: Colors.green,
                    onPressed: (){
                      if(index < 4){
                        index++;
                      }else{
                        index=0;
                      }
                      setState(() {

                      });
                    }, child: const Text('Next', style: TextStyle(color: Colors.white),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  const BuildListTile({
    required this.serial,
    required this.option,
    required this.trail,
    required this.onOptionPress,
    required this.listTileBgColor,
    Key? key,
  }) : super(key: key);

  final String serial;
  final String option;
  final Icon trail;
  final VoidCallback onOptionPress;
  final Color listTileBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: listTileBgColor,
          border: Border.all(),
          borderRadius: BorderRadius.circular(35)),
      child: ListTile(
        onTap: onOptionPress,
        leading: CircleAvatar(
          child: Text(serial),
        ),
        title: Text(option),
        trailing: trail,
      ),
    );
  }
}

