import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'answer_brain.dart';
const inactiveColor=Color(0xFF111328);
const activeColor=Color(0xFF1D1E33);

enum Gender{
  male,
  female,

}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Gender selectedone;
  int height=150;
  int weight=30;
  int age=15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
      ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         Expanded(
           child: Row(
             children: <Widget>[
               Expanded(
                       child: GestureDetector(
                         onTap: (){
setState(() {
  selectedone=Gender.male;
  print("male");
});
                         },
                         child: Reusablecard(selectedone==Gender.male?activeColor:inactiveColor,
                           widget: Icons(ic:FontAwesomeIcons.mars,name: "MALE",),),
                       ),

               ),
               Expanded(
                 child: GestureDetector(
                   onTap: (){
                   setState(() {
                     selectedone=Gender.female;
                     print("female");
                   });

                   },
                     child: Reusablecard(selectedone==Gender.female?activeColor:inactiveColor,widget:Icons(ic:FontAwesomeIcons.venus,name: "FEMALE",), )),

               ),
             ],
           ),
         ),
         Expanded(
           child: Reusablecard(Color(0xFF1D1E33),widget:
             Column(
               mainAxisAlignment: MainAxisAlignment.center,

               children: <Widget>[
                 Text(""
                     "HEIGHT",style: TextStyle(fontSize: 20.0,color: Color(0xFF8D8e98)),),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text(
                      height.toString(),style: TextStyle(
                       fontSize: 40.0,
                       fontWeight: FontWeight.w900
                     ),
                     ),
                     Text("cm",style: TextStyle(fontSize: 20.0,color: Color(0xFF8D8e98)),)
                   ],
                 ),
                 SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                   activeTrackColor: Colors.white,
                     inactiveTrackColor: Color(0xFF8D8E98),
                     overlayColor: Color(0x29EB1555),
                     thumbColor: Color(0xFFEB1555),
                     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                     overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                   ),
                   child: Slider(
                     value: height.toDouble(),
                     max: 250,
                     min:100,


                     onChanged: (double newvalue){
                       setState(() {
                         height=newvalue.round();
                       });
                     },

                   ),
                 )
               ],
             ),),

         ),
         Expanded(
           child: Row(

             children: <Widget>[
               Expanded(child: Reusablecard(Color(0xFF1D1E33),widget: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("WEIGHT",style: TextStyle(fontSize: 20.0,color: Color(0xFF8D8e98)),),
                   Text(weight.toString(),style: TextStyle(
                       fontSize: 40.0,
                       fontWeight: FontWeight.w900
                   ),),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Roundiconbutton(
                         icon: FontAwesomeIcons.plus,
                         fun: (){
                           setState(() {
                             weight++;
                           });
                         },
                       ),
                       SizedBox(
                         width: 5.9,
                       ),
                       Roundiconbutton(
                         icon: FontAwesomeIcons.minus,
                         fun: (){
                           setState(() {
                             weight--;
                           });
                         },
                       ),
                     ],
                   )

                 ],
               )),),
               Expanded(child: Reusablecard(Color(0xFF1D1E33),widget: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("AGE",style: TextStyle(fontSize: 20.0,color: Color(0xFF8D8e98)),),
                   Text(age.toString(),style: TextStyle(
                       fontSize: 40.0,
                       fontWeight: FontWeight.w900
                   ),),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Roundiconbutton(
                         icon: FontAwesomeIcons.plus,
fun: (){
                           setState(() {
                             age++;
                           });
},

                       ),
                       SizedBox(
                         width: 5.9,
                       ),
                       Roundiconbutton(
                         icon: FontAwesomeIcons.minus,
fun: (){
                           setState(() {
                             age--;
                           });
},
                       ),
                     ],
                   )

                 ],
               ))
               )
             ],

           ),
         ),
         GestureDetector(
         onTap: (){

           Answer a1=Answer(height, weight);
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Resultpage(
             bmival: a1.bmi1(),
             bmirec: a1.result2(),
             bmires: a1.result(),

           ))) ;
         },
           child: Container(
             child: Center(
               child: Text("CALCULATE",style: TextStyle(
                 fontSize: 25.0,
                 fontWeight: FontWeight.w900
               ),),
             ),
             color: Color(0xFFFB1555),
             width: double.infinity,
             height: 60.0,
             margin: EdgeInsets.only(top: 10.0),
           ),
         )
       ],
     )
    );
  }
}

class Icons extends StatelessWidget {
  final IconData ic;
  final String name;
 Icons({this.ic,this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ic,
          size: 70.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,style: TextStyle(fontSize: 20.0,color: Color(0xFF8D8e98)),
        )
      ],
    );
  }
}

class Reusablecard extends StatelessWidget {
  final Color colour;
  final Widget widget;
  Reusablecard(@required this.colour,{this.widget});

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
class Roundiconbutton extends StatelessWidget {
  final IconData icon;
  final Function fun;
  Roundiconbutton({this.icon,this.fun});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4E4F5E),
      constraints: BoxConstraints.tightFor(height: 46.0,width: 46.0),
     elevation: 6.0,
      onPressed: fun,

    );
  }
}

