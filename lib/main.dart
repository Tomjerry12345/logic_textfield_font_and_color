import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text("Textfield")),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text1 = "Test";

  List<Color> listColor = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue
  ];

  List<Text> listText() {
    List<Text> widgetText = [];
    var i = 0;
    for (var element in text1.characters) {
      widgetText.add(Text(
        element,
        style: TextStyle(color: listColor[i], fontSize: i == 0 ? 14 : (20 * i.toDouble())),
      ));
      i += 1;

      if (i > 3) {
        i = 0;
      }
    }

    return widgetText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: listText()),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Input Text"),
            onChanged: (value) {
              setState(() {
                text1 = value;
              });
              print(text1);
            },
          ),
        ],
      ),
    );
  }
}
