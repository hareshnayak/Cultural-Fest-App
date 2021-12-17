import 'package:engifest_22/database/auth.dart';
import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Auth auth = Auth();
  final AppColors colors = AppColors();
  void forgotPass(){

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.08),
        child: Column(
          children: [
            Container(child: Text('Login with email'),),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,20,0,0 ),
              child: Center(child: Button(context,'','Login with email',colors.buttonGreen,auth.loginEmail)),
            ),
            InkWell(
              onTap: forgotPass,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0,10,0,0 ),
                child: Text('Forgot Password?'),alignment: Alignment.bottomRight,),
            ),
          ],
        ),
      ),
    );
  }
}
