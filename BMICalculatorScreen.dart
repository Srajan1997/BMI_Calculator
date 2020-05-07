import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

  class _BMICalculatorScreenState extends State<BMICalculatorScreen> {

    double user_height = 100.00, user_weight = 40.00, user_BMI=0, height_in_feet=0,height_in_feet_rem=0, weight_in_pounds=0, height_in_inches=0;
    String res = "",xs,ys;
    int x=0,y=0;
    
    @override
  
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Container(
          width: 75, height: 75,
          child: Image.asset("assets/images/charity.png", fit: BoxFit.contain),
  ),
    SizedBox(height: 18),
    Text("healthFirst", style: TextStyle(color: Colors.red[300],fontSize: 36, fontWeight: FontWeight.w700)),
    SizedBox(height: 18),
    Text("BMI CALCULATOR", style: TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.w400)),
    SizedBox(height: 40),
    Text("Your Height", style: TextStyle(color: Colors.blue[400],fontSize: 24, fontWeight: FontWeight.w700)),
   
    Container(
      padding: EdgeInsets.all(5),
      child: Slider(
        min: 80, max: 240,
        onChanged: (height){
          setState((){
            user_height = height;
            height_in_feet = user_height/(2.54*12);
            height_in_inches = (user_height/2.54)%12;
            user_BMI = user_weight/((user_height/100)*(user_height/100));
            user_BMI = double.parse((user_BMI).toStringAsFixed(2));
            height_in_feet_rem = double.parse((height_in_feet).toStringAsFixed(0));
            height_in_inches = height_in_feet - height_in_feet_rem;
            height_in_inches *= 12;
            x = height_in_inches.toInt();
            y = height_in_feet_rem.toInt();
            if(x<0) { y--; x+=10;}
            if(user_BMI<18.50) res = "UNDERWEIGHT";
            else if(user_BMI>18.49 && user_BMI<25.00) res = "NORMAL WEIGHT";
            else if(user_BMI>24.99 && user_BMI<30.00) res="OVER WEIGHT";
            else if(user_BMI>29.99) res = "OBESE"; 
          });
        },
        value: user_height,
        divisions: 160,
        activeColor: Colors.blue[400],
        label: '$user_height CM',
      ),
      
    ),

        Text("$user_height CM = $y' $x''", style: TextStyle(color: Colors.blue[300],fontSize: 16, fontWeight: FontWeight.w400)),
SizedBox(height: 36),
    Text("Your Weight",style: TextStyle(color: Colors.green[400],fontSize: 24, fontWeight: FontWeight.w700)),
    Container(
      padding: EdgeInsets.all(5),
      child: Slider(
        min: 40,
        max: 100,
        onChanged: (weight){
          setState((){
            user_weight = weight;
            weight_in_pounds = user_weight/2.20462;
            weight_in_pounds = double.parse((weight_in_pounds).toStringAsFixed(2));
            user_BMI = user_weight/((user_height/100)*(user_height/100));
            user_BMI = double.parse((user_BMI).toStringAsFixed(2));
            if(user_BMI<18.50) res = "UNDERWEIGHT";
            else if(user_BMI>18.49 && user_BMI<25.00) res = "NORMAL WEIGHT";
            else if(user_BMI>24.99 && user_BMI<30.00) res="OVER WEIGHT";
            else if(user_BMI>29.99) res = "OBESE"; 
          });
        },
        value: user_weight,
        divisions: 60,
        activeColor: Colors.green[400],
        label: '$user_weight KG',
      ),
      
    ),

  Text("$user_weight KG = $weight_in_pounds POUNDS", style: TextStyle(color: Colors.green[300],fontSize: 16, fontWeight: FontWeight.w400)),   
  SizedBox(height: 48),
  Text("$user_BMI", style: TextStyle(color: Colors.red[300],fontSize: 36, fontWeight: FontWeight.w400)),  
  SizedBox(height: 12),
  Text("$res", style: TextStyle(color: Colors.black,fontSize: 18, fontWeight: FontWeight.w400)),    
  ],
  )
          ),
      ),
  );
  }
  }
