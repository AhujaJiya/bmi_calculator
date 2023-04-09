import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'BMI App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgcolor = Colors.purple.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Calculate your BMI',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text("Enter your weight in Kg"),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text("Enter your height in Feet"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text("Enter your height in Inch"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        //BMI Calculation

                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = (iFt * 12) + iInch;

                        var tCm = tInch * 2.54;

                        var tM = tCm / 100;
                        var bmi = iWt / (tM * tM);

                        var msg = "";
                        if (bmi > 25) {
                          msg = "You are Overweight";
                          bgcolor = Colors.redAccent;
                        } else if (bmi < 18) {
                          msg = "You are Underweight";
                          bgcolor = Colors.orange.shade200;
                        } else {
                          msg = "You are healthy!";
                          bgcolor = Colors.green.shade200;
                        }
                        result =
                            "$msg \n\n Your BMI is: ${bmi.toStringAsFixed(2)}";
                        setState(() {});
                      } else {
                        setState(() {
                          result = "Please fill all the required blanks!";
                        });
                      }
                    },
                    child: const Text("Calculate"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
