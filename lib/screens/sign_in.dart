import 'package:flutter/material.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/services/auth.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/loading.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String errmsg = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                            controller: emailController,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: grey,
                              ),
                            ),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter the email' : null,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: textInputDecoration.copyWith(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.password_outlined,
                                color: grey,
                              ),
                            ),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter the password' : null,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '$errmsg',
                            style: TextStyle(
                              color: red,
                              fontSize: fontSize18,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                dynamic result = await _auth.signin(
                                    email: emailController.text.trim(),
                                    password: passwordController.text);
                                if (!result) {
                                  setState(() {
                                    this.errmsg =
                                        'Can\'t Signin with those credintials';
                                    loading = false;
                                  });
                                } else {
                                  setState(() {
                                    this.errmsg = '';
                                    loading = true;
                                  });
                                  await Provider.of<ProductProviders>(context,
                                          listen: false)
                                      .load();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/adminhome', (route) => false);
                                }
                              }
                            },
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SignInButton(
                              Buttons.GoogleDark,
                              onPressed: () async {
                                try {
                                  dynamic result =
                                      await _auth.signinWithGoogle();
                                  if (result == false)
                                    setState(() {
                                      this.errmsg =
                                          'Can\'t Signin with those credintials';
                                      loading = false;
                                    });
                                  else {
                                    setState(() {
                                      this.errmsg = '';
                                      loading = true;
                                    });
                                    await Provider.of<ProductProviders>(context,
                                            listen: false)
                                        .load();
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/home', (route) => false);
                                  }
                                } catch (e) {
                                  print('error ${e.toString()}');
                                  return null;
                                }
                              },
                            ),
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
