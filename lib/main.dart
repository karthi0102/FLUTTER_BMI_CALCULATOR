import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course Assignment',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const BMICalculator(),
    );
  }
}
class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final _formkey = new GlobalKey<FormState>();
  final TextEditingController height = new TextEditingController();
  final TextEditingController weight = new TextEditingController();
  var bmi = "";
  var classification = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(80),
        child: Container(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: height,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Enter your height",
                        labelText: "Enter your height",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.length < 0) {
                        return "Must have value greater than 0";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Enter your weight",
                        labelText: "Enter your weight",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.length < 0) {
                        return "Must have value greater than 0";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        if (!_formkey.currentState!.validate()) {
                          return;
                        }
                        var output = double.parse(weight.text) /
                            ((double.parse(height.text) *
                                        double.parse(height.text)) /
                                    10000)
                                .round();
                        setState(() {
                          bmi = output.toString();
                          if (output <= 18.5) {
                            classification = "Under Weight";
                          } else if (output >= 18.5 && output <= 24.9) {
                            classification = "Normal Weight";
                          } else if (output >= 25 && output <= 24.9) {
                            classification = "Over Weight";
                          } else {
                            classification = "Obesity";
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20)),
                      child: Text("Calculate BMI")),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    "Your BMI is:" + bmi,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    classification,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
