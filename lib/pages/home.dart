import 'package:flutter/material.dart';
import 'package:to_do/services/database.dart';
import 'package:random_string/random_string.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today = true, tomorrow=false, nextweek=false;
  bool suggest = false;
  TextEditingController todocontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor:Color(0xFF5A0E24),
        onPressed:(){
            openBox();
    },
      child: Icon(Icons.add,color: Color(0xFFFFF2C6),size: 40.0,),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60.0,left: 30.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF5A0E24),Color(0xFF76153C),Color(0xFFBF124D),Color(0xFFFFF2C6),Color(0xFFFFF2C6)],begin: Alignment.topLeft,end: Alignment.bottomRight),),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Hello\nUser,",style: TextStyle(fontSize: 45.0,color: Colors.white,fontWeight: FontWeight.w500,fontFamily: 'Times New Roman'),),
            SizedBox(height: 20.0,),
            Text("Have a good day!!",style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.w100,fontFamily: 'Times New Roman'),),
            SizedBox(height: 35.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                today? Material(
                  elevation: 12.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFFFF2C6),borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                child:
                Text("Today",
                  style: TextStyle(fontFamily: 'Times New Roman',
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600),
                )
                ),
                ):GestureDetector(
                  onTap:(){
                    today=true;
                    tomorrow=false;
                    nextweek=false;
                    setState(() {

                    });
                },
                child: Text("Today",
                  style: TextStyle(fontFamily: 'Times New Roman',
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                )
                ),

                tomorrow? Material(
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      decoration: BoxDecoration(color: Color(0xFFFFF2C6),borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      child:
                      Text("Tomorrow",
                        style: TextStyle(fontFamily: 'Times New Roman',
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600),
                      )
                  ),
                ):GestureDetector(
                    onTap:(){
                      today=false;
                      tomorrow=true;
                      nextweek=false;
                      setState(() {

                      });
                    },
                    child: Text("Tomorrow",
                      style: TextStyle(fontFamily: 'Times New Roman',
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    )
                ),

                nextweek? Material(
                  elevation: 12.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      decoration: BoxDecoration(color: Color(0xFFFFF2C6),borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      child:
                      Text("Next Week",
                        style: TextStyle(fontFamily: 'Times New Roman',
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600),
                      )
                  ),
                ):GestureDetector(
                    onTap:(){
                      today=false;
                      tomorrow=false;
                      nextweek=true;
                      setState(() {

                      });
                    },
                    child: Text("NextWeek",
                      style: TextStyle(fontFamily: 'Times New Roman',
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    )
                ),
              ],

            ),
            SizedBox(height: 70),
            CheckboxListTile(
              activeColor: Colors.green,
              title: Text("Go to the Gym",style: TextStyle(fontSize: 22.0,color: Colors.white,fontWeight: FontWeight.w900),),
              value: suggest, onChanged: (newValue){
              setState(() {
                suggest=newValue!;
              });
            },
              controlAffinity: ListTileControlAffinity.leading,
            )
      ],),),
    );
  }
  Future openBox()=> showDialog(context: context, builder: (context)=> AlertDialog(
    content: SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },child: Icon(Icons.cancel)),

              SizedBox(width: 50.0,),
              Text("Add the work ToDo",style: TextStyle(color:Color(0xFF5A0E24),fontWeight: FontWeight.w900,fontSize: 15.0),),

      ],
            ),
            SizedBox(height: 20.0),
            Text("Add Work",style: TextStyle(fontWeight: FontWeight.w900),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF5A0E24),
                  width: 2.0,
                ),borderRadius: BorderRadius.circular(10),
              ),child: TextField(
              controller: todocontroller,
              decoration: InputDecoration(
                border: InputBorder.none,hint: Text("Enter Task")
              ),
            ),
            ),
            SizedBox(height: 20.0,),
            GestureDetector(
              onTap: (){
                String id = randomAlphaNumeric(10);
                Map<String,dynamic> userTodo={
                  "Work":todocontroller.text,
                  "Id": id,
                };
                today
                    ? DatabaseMethods().addTodayWork(userTodo, id):
                tomorrow
                    ? DatabaseMethods().addTomorrowWork(userTodo, id):
                      DatabaseMethods().addNextWeekWork(userTodo, id);
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: 70.0,
                  decoration: BoxDecoration(color: Color(0xFF5A0E24),borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("ADD",style: TextStyle(color: Color(0xFFFFF2C6),fontWeight: FontWeight.w900),)),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ));
}
