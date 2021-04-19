import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZEWAA',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String res;
  String operatortoperform;

  void btnClicked(String btnval){
    if(btnval == "C"){
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    }
    else if(btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/"){
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    }
    else if(btnval == "="){
      secondnum = int.parse(texttodisplay);
      if(operatortoperform == "+"){
        res = (firstnum + secondnum).toString();
      }
      if(operatortoperform == "-"){
        res = (firstnum - secondnum).toString();
      }
      if(operatortoperform == "x"){
        res = (firstnum * secondnum).toString();
      }
      if(operatortoperform == "/"){
        res = (firstnum ~/ secondnum).toString();
      }
    }
    else{
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }


  Widget customButton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => { btnClicked(btnval)},
        child: Text(
          "$btnval",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ZEWAA CALCULATOR"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                 "$texttodisplay" ,
                 style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600 
                 ),
                ),
              ) 
            ),
            Row(
              children: [
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+")
              ],
            ),
            Row(
              children: [
                customButton("6"),
                customButton("5"),
                customButton("4"),
                customButton("-")
              ],
            ),
            Row(
              children: [
                customButton("3"),
                customButton("2"),
                customButton("1"),
                customButton("x")
              ],
            ),
            Row(
              children: [
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/")
              ],
            )
          ],
        ),
      ),
    );
  }
}
