import 'package:flutter/material.dart';
import 'package:string_scanner/string_scanner.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   double val=0;
   int groupValue=0;
//  bool ftc = false;
//  bool ctf = false;
   String finalAnswer='0';

  handleTemperature(int value) {
    setState(() {
      if (value == 1) {
        //fahrenheit to celsius
        groupValue = 1;
//        ctf = false;
//        ftc = true;
        var ans = (val - 32.0) / 1.8;
        finalAnswer = ans.toString() + " C";
      } else if (value == 2) {
        //celsius to fahrenheit
        groupValue = 2;
//        ctf = true;
//        ftc = false;
        var ans = (val * 1.8) + 32;
        finalAnswer = ans.toString() + " F";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Enter value'),
            onChanged: (String value) {
              if (value.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please Enter Something')));
                finalAnswer = '';
                return;
              } else {
                val = double.parse(value);
              }
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: <Widget>[
              Radio(
                  activeColor: Colors.red,
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (e) {
                    setState(() {
                      handleTemperature(e!);
                    });
                  }),
              Text("Fahrenheit To Celsius"),
              SizedBox(
                height: 5.0,
              ),
              Radio(
                  activeColor: Colors.red,
                  value: 2,
                  groupValue: groupValue,
    onChanged: (e) {
      setState(() {
        handleTemperature(e!);
      });
    }),
              Text("Celsius To Fahrenheit"),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Text('Clear'),
            onPressed: () {
              setState(() {
                if(finalAnswer==null){
                  return;
                };
              });
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(finalAnswer == null ? '' : finalAnswer)
        ],
      ),
    );
  }
}
