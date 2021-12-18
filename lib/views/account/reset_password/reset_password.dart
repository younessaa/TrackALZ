import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:trackalz/widgets/button.dart';
import 'package:trackalz/widgets/custom_appbar.dart';
import 'package:trackalz/widgets/input_textfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: ''),
      body: BodyResetPassword(),
    );
  }
}

class BodyResetPassword extends StatefulWidget {
  BodyResetPassword({
    Key key,
  }) : super(key: key);

  @override
  _BodyResetPasswordState createState() => _BodyResetPasswordState();
}

class _BodyResetPasswordState extends State<BodyResetPassword> {
  final emailController = TextEditingController();
  bool _isLoading = false;

  toggleSpinner() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      //progressIndicator: CircularIndicator(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Réinitialiser le mot de passe",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Entrez l'e-mail associé à votre compte\net nous vous enverrons un e-mail avec des instructions pour réinitialiser votre mot de passe.",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Adresse e-mail",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  InputTextField(
                    hintText: "Entrer l'adresse e-mail",
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Button(
                    color: Colors.red,
                    textColor: Colors.white,
                    text: "Envoyer les instructions",
                    fontSize: 16,
                    onPressed: () async {
                      Navigator.pushNamed(context, "/CheckEmail");
                      /* toggleSpinner();
                      try {
                        await resetPassword(emailController.text.trim());
                        Navigator.pushNamed(context, "/CheckEmail");
                      } catch (error) {
                        showMessage(context, error);
                      }
                      toggleSpinner(); */
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
