import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today = true, tomorrow=false, nextweek=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0,left: 30.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF5A0E24),Color(0xFF76153C),Color(0xFFBF124D),Color(0xFFFFF2C6),Color(0xFFFFF2C6)],begin: Alignment.topCenter,end: Alignment.bottomCenter),),

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
                  elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFF1A2A4F),borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                child:
                Text("Today",
                  style: TextStyle(fontFamily: 'Times New Roman',
                      color: Colors.white,
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
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      decoration: BoxDecoration(color: Color(0xFF1A2A4F),borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      child:
                      Text("Tomorrow",
                        style: TextStyle(fontFamily: 'Times New Roman',
                            color: Colors.white,
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
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      decoration: BoxDecoration(color: Color(0xFF1A2A4F),borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      child:
                      Text("Next Week",
                        style: TextStyle(fontFamily: 'Times New Roman',
                            color: Colors.white,
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

            )
      ],),),
    );
  }
}
