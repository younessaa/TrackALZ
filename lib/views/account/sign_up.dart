import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trackalz/widgets/auth_botton.dart';
import 'package:trackalz/widgets/background.dart';
import 'package:trackalz/widgets/button.dart';
import 'package:trackalz/widgets/custom_appbar.dart';
import 'package:trackalz/widgets/input_textfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(title: ''),
        body: Stack(
          children: [
            Background(),
            TopSignUp(),
          ],
        ),
      ),
    );
  }
}

//! Top layer widget sign up
class TopSignUp extends StatelessWidget {
  const TopSignUp({
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
            logInwithmail(),
            SizedBox(height: 25),
            InputField(
              nameField: "Nom d'utilisateur",
            ),
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
            SizedBox(height: 10),
            SignUpIfAcc(),
          ],
        ),
      ),
    );
  }
}

//! deja membre ? connexion
class SignUpIfAcc extends StatelessWidget {
  const SignUpIfAcc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Déjà membre ?",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/SignIn"),
          child: Text(
            "Connexion",
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

//! custom textfield sign in
class InputField extends StatelessWidget {
  const InputField({
    this.nameField,
    Key key,
  }) : super(key: key);

  final String nameField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              nameField,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ),
          SizedBox(height: 6),
          InputTextField(
            radius: 13,
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

//! widget "Ou s'inscrire par e-mail"
Row logInwithmail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: 70,
        height: 2,
        color: Color(0xff898989),
      ),
      Text(
        "Ou S'inscrire par e-mail",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      Container(
        width: 70,
        height: 2,
        color: Color(0xff898989),
      ),
    ],
  );
}
