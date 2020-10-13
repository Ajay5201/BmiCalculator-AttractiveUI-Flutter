import 'package:flutter/material.dart';
import 'input_file.dart';
class Resultpage extends StatelessWidget {
  final String bmival;
  final String bmires;
  final String bmirec;
  Resultpage({this.bmival,this.bmires,this.bmirec});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text("YOUR ANSWER",style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
          Expanded(
            flex: 5,
              child:    Reusablecard(Color(0xFF1D1E33),widget:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      bmires,style: TextStyle(
                      fontSize: 23.0
                          ,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade500,

                    ),
                    ),
                    Text(
                    bmival,style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  Text(
                    bmirec,textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 25.0
                  ),

                  )
                                      ],
                ),)
                  

            
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp())) ;
            },
            child: Container(
              child: Center(
                child: Text("RE-CALCULATE",style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900
                ),),
              ),
              color: Color(0xFFFB1555),
              width: double.infinity,
              height: 60.0,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
class Reusablecard extends StatelessWidget {
  final Color colour;
  final Widget widget;

  Reusablecard(@required this.colour, {this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),

    );
  }
}