import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class Signin extends StatelessWidget {
  final _formkey = GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Continue with email...',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
              Container(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
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
                            Icons.lock,
                            color: Colors.grey,
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
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(40),
                          primary: Color(
                              0xFFA83332), // fromHeight use double.infinity as width and 40 is the height
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Create an account',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 15.0,
                                color: Color(0xFFA83332),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 15.0,
                                color: Color(0xFFA83332),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
