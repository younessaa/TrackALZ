import 'package:flutter/material.dart';
import 'package:trackalz/models/tagret.dart';
import 'package:trackalz/views/home.dart';

class AddSemelle extends StatefulWidget {
  
  @override
  _AddSemelleState createState() => _AddSemelleState();
}

class _AddSemelleState extends State<AddSemelle> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  Target _target;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFB8B8B8).withOpacity(0.7),
          title: Center(
            child: Text(
              "Ajouter une semelle",
              style: TextStyle(
                fontSize: 24
              )
            ),
          ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 36, left: 20, right: 20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: controller1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nom',
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  controller: controller2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Numéro',
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  width: size.width * 0.7,
                  child: TextButton(
                    onPressed: () {
                      if(controller1.text.isNotEmpty && controller2.text.isNotEmpty){
                        _target = Target(controller1.text, controller2.text);
                        _target.connected = true;
                        Home.listOfTargets.add(_target);
                        Navigator.pop(context);
                      }
                    }, 
                    child: Text(
                      'Enregitrer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                      
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue[400]
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      )
      );
  }
}
