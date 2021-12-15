import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFB8B8B8).withOpacity(0.7),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.menu),
              Container(
                margin: EdgeInsets.only(left: 80),
                child: NewWidget(),
              ),
            ],
          )
        ),
        body: Center(
          child: NewWidget(),
        ),
      )
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Track',
        style: TextStyle(color:Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
        children: <InlineSpan>[
          TextSpan(
            text: 'ALZ',
            style: TextStyle(color:Colors.red, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ]
      )
    );
  }
}
