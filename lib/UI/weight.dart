import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeightState();
  }
}

class WeightState extends State<Weight> {
  double calculateWeight(weight, multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    }
    return 0.00;
  }

  final TextEditingController _weight = new TextEditingController();
  double result = 0.0;
  String finalResult = "";
  int radio = 0;
   inputChange(String val){
    setState((){
      getWeight(radio);
    });
  }
  void getWeight(val) {
    setState(() {
      radio = val;
      switch (radio) {
        case (0):
          result = calculateWeight(_weight.text, 0.06);
          finalResult = "Your weight on Pluto is ${result.toStringAsFixed(2)}";
          break;
        case (1):
          result = calculateWeight(_weight.text, 0.38);
          finalResult = "Your weight on Mars is ${result.toStringAsFixed(2)}";
          break;
        case (2):
          result = calculateWeight(_weight.text, 0.91);
          finalResult = "Your weight on Venus is ${result.toStringAsFixed(2)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Weight on Planet"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: new Container(
          child: new ListView(
        padding: const EdgeInsets.all(2.5),
        children: <Widget>[
          new Center(
            child: new Container(
              height: 120.0,
              width: 120.0,
              child: new Image.asset('images/planet.png'),
            ),
          ),
          new Container(
            margin: const EdgeInsets.all(3.0),
            alignment: Alignment.center,
            child: new Column(children: <Widget>[
              new TextField(onChanged: inputChange,
                  keyboardType: TextInputType.number,
                  controller: _weight,
                  decoration: new InputDecoration(
                    labelText: "Your weight on earth",
                    hintText: "In pounds",
                    icon: new Icon(Icons.person_outline),
                  )),
              new Padding(
                padding: EdgeInsets.all(12.5),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio<int>(
                      activeColor: Colors.brown,
                      value: 0,
                      groupValue: radio,
                      onChanged: getWeight),
                  new Text(
                    "Pluto",
                    style: new TextStyle(color: Colors.white30),
                  ),
                  new Radio<int>(
                      activeColor: Colors.red,
                      value: 1,
                      groupValue: radio,
                      onChanged: getWeight),
                  new Text(
                    "Mars",
                    style: new TextStyle(color: Colors.white30),
                  ),
                  new Radio<int>(
                      activeColor: Colors.orangeAccent,
                      value: 2,
                      groupValue: radio,
                      onChanged: getWeight),
                  new Text(
                    "Venus",
                    style: new TextStyle(color: Colors.white30),
                  ),
                ],
              ),
              //result text
              //add padding to text
              new Padding(padding: EdgeInsets.all(20.5)),
              new Text(
                _weight.text.toString().isEmpty ? "Please enter weight":"$finalResult",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500),
              )
            ]),
          )
        ],
      )),
    );
  }
}
