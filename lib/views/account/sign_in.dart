import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trackalz/views/account/sign_up.dart';
import 'package:trackalz/widgets/auth_botton.dart';
import 'package:trackalz/widgets/background.dart';
import 'package:trackalz/widgets/button.dart';
import 'package:trackalz/widgets/input_textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        body: Stack(
          children: [
            Background(),
            TopSignIn(),
          ],
        ),
      ),
    );
  }
}

//! Top layer widget sign in
class TopSignIn extends StatelessWidget {
  const TopSignIn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 232),
            AuthButton(
              backgroundColor: Colors.red,
              textButton: "Connectez vous avec Google",
              colorText: Colors.white,
              icon: FontAwesomeIcons.google,
              function: () {},
            ),
            SizedBox(height: 25),
            widgetOU(),
            SizedBox(height: 25),
            InputField(
              nameField: "E-mail",
            ),
            InputField(
              nameField: "Mot de passe",
            ),
            SizedBox(height: 20),
            Button(
              text: "S'inscrire",
              textColor: Colors.white,
              color: Colors.red,
              fontSize: 18,
              onPressed: () {},
            ),
            SizedBox(height: 15),
            SignInIfAcc(),
          ],
        ),
      ),
    );
  }
}

//! mot de passe oublié ? recuperation
class SignInIfAcc extends StatelessWidget {
  const SignInIfAcc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Mot de passe oublié ?",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Récupération",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

//! widget Ou
Row widgetOU() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: 130,
        height: 2,
        color: Color(0xff898989),
      ),
      Text(
        "Ou",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      Container(
        width: 130,
        height: 2,
        color: Color(0xff898989),
      ),
    ],
  );
}
