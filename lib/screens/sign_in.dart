import 'package:flutter/material.dart';
import 'package:miu_food_court/services/auth.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Signin'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'SignIn',
                    style: TextStyle(
                      fontSize: fontSize30,
                    ),
                  ),
                ],
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: grey,
                        ),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: grey,
                        ),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter the password' : null,
                      onChanged: (val) {},
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: fontSize15,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(40),
                        primary:
                            red, // fromHeight use double.infinity as width and 40 is the height
                      ),
                    ),
                    SignInButton(
                      Buttons.Google,
                      onPressed: () async {
                        try {
                          await _auth.signinWithGoogle();
                        } catch (e) {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
