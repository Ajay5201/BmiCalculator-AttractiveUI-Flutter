import 'dart:math';
class Answer{
  final int height;
  final int weight;

  double bmi;
  Answer(this.height,this.weight);

  String bmi1()
  {
   bmi = weight/pow(height/100, 2);
   return bmi.toStringAsFixed(1);
  }
  String result()
  {
    if(bmi>=25)
      {
        return "OVERWEIGHT";
      }
    else if(bmi>18.5)
      {
        return "NORMAL";
      }
    else
      {
        return "UNDERWEIGHT";
      }
  }
  String result2()
  {
    if(bmi>=25)
    {
      return "You have higher body weight!! Try to exercise ";
    }
    else if(bmi>18.5)
    {
      return "You have a normal body weight!! God job";
    }
    else
    {
      return "Your BMI is quite low so take more vegitables!!";
    }
  }
}