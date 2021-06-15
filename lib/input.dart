import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable.dart';
import 'icon_content.dart';
import 'constant.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseable(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    Colour: selectedGender == Gender.male
                        ? KRreuseableColor
                        : KNRnonreuseableColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseable(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    Colour: selectedGender == Gender.female
                        ? KRreuseableColor
                        : KNRnonreuseableColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reuseable(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: KLlabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: KLlabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context),
                    child: Slider(
                        value: height.toDouble(),
                        min : 120.0,
                        max: 220.0,
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                    ),
                  ),
                ],
              ),
              Colour: KRreuseableColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuseable(
                    Colour: KRreuseableColor,
                  ),
                ),
                Expanded(
                  child: Reuseable(
                    Colour: KRreuseableColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: KBCbottomColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: KBbottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
