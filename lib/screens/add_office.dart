import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/admin_side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/admin_top_bar.dart';

class AddOffice extends StatefulWidget {
  AddOffice({Key? key}) : super(key: key);

  @override
  _AddOfficeState createState() => _AddOfficeState();
}

class _AddOfficeState extends State<AddOffice> {
  @override
   final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerEmail = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminSideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AdminTopBarOffice('View Ofiicers'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
             
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: const Text('Add Office',
                      style: TextStyle(fontSize: 16)),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFA83332))),
                      labelText: 'E-mail'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFA83332))),
                      labelText: 'Password'),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 100,
                  child: TextButton(
                    child: const Text('Add ', style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFA83332))),
                  
                    onPressed: () => doUserRegistration(),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: const Text("User was successfully created!"),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doUserRegistration() async {
		//Sigup code here
  }
}
       


