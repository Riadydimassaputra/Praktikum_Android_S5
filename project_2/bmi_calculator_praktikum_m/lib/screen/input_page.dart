import 'package:flutter/material.dart';
import 'package:bmi_calculator_praktikum_m/componen/bottom_button.dart';
import 'package:bmi_calculator_praktikum_m/componen/round_button_icon.dart';
import 'package:bmi_calculator_praktikum_m/constant.dart';
import 'package:bmi_calculator_praktikum_m/calculator_brain.dart';
import 'package:bmi_calculator_praktikum_m/screen/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../componen/icon_content.dart';
import '../componen/reusable_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

enum Gender { Male, Female}

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 30;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //ini untuk jenis kelamin
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    cardChild: IconContent(
                      icon : FontAwesomeIcons.mars,
                      label: 'PRIA',
                    ),
                      colour: selectedGender == Gender.Male ? kActiveCardColor : kInactiveCardColor,
                    ),
                ),
                Expanded(
                  child: ReusableCard(
                     onPress: (){
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, 
                      label: 'WANITA'),
                       colour: selectedGender == Gender.Female ? kActiveCardColor : kInactiveCardColor,
                      ),
                ),
              ],
            ),
          ),

          //ini untuk tinggi badan
          Expanded(
              child: ReusableCard(
                colour: kActiveCardColor, 
                cardChild : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tinggi',
                    style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text('cm', style: kLabelStyle,
                            )
                          ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                    activeTrackColor : Colors.white, 
                    inactiveTrackColor : Color(0xFF8D8E98),
                    thumbColor : Color(0xFFEB1555),
                    overlayColor : Color(0x29EB1555),
                    thumbShape : 
                    RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderThumbShape(
                      enabledThumbRadius: 20.0)),
                    child : Slider(
                      value: height.toDouble(),
                      min : 120.0,
                      max : 220.0,
                      onChanged : (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )), 
                  ],
                ),
              ),
          ),

          //ini untuk berat dan umur
          Expanded(
            child: Row(children : [ 
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('BERAT', style: kLabelStyle,
                      ),
                      Text(weight.toString(), style: kNumberTextStyle,
                      ),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           RoundButtonIcon(icon: FontAwesomeIcons.minus, onPressed: (){
                             setState(() {
                               if (weight > 30) weight--;
                             });
                           },
                           ), 
            
                           SizedBox(
                             width: 10.0,
                           ),
                            RoundButtonIcon(icon: FontAwesomeIcons.plus, onPressed: (){
                             setState(() {
                               weight++;
                             });
                           },
                           ),
                         ],
                      )
                    ],
                  ),
              ),
              ),

                Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('UMUR', style: kLabelStyle,
                      ),
                      Text(age.toString(), style: kNumberTextStyle,
                      ),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           RoundButtonIcon(icon: FontAwesomeIcons.minus, onPressed: (){
                             setState(() {
                               if (age > 1) age--;
                             });
                           },
                           ), 
            
                           SizedBox(
                             width: 10.0,
                           ),
                            RoundButtonIcon(icon: FontAwesomeIcons.plus, onPressed: (){
                             setState(() {
                               age++;
                             });
                           },
                           ),
                         ],
                      )
                    ],
                  ),
              ),
              ),
              ],
              ),
          ),
              
          //ini untuk menghitung
         BottomButton(
           buttonText: "HITUNG", 
           onTap : (){
             CalculatorBrain hitung = CalculatorBrain(height: height, weight : weight);
           Navigator.pushNamed(context, ResultPage.routeName, 
           arguments: ResultPage(
            bmiResult : hitung.calculateBMI(),
            resultText: hitung.getResult() ,
            interpretation : hitung.getInterpretation(),
           ));
           })
          ],
    ));
  }
}




