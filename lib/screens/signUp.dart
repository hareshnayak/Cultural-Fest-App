import 'package:engifest_22/database/auth.dart';
import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Auth auth = Auth();
  final AppColors colors = AppColors();

  void forgotPass() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              height: size.height * 0.15,
              margin: EdgeInsets.fromLTRB(
                  0, size.height * 0.15, 0, size.height * 0.05),
              child: Image.asset('assets/images/engi_logo.png'),
            ),
            Container(
              child: Text(
                'Sign up with email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: editText(
                context,
                'Name',
                Text(''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: editText(
                context,
                'Email',
                Text(''),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: editText(
                  context,
                  'Password',
                  Text(''),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Center(
                  child: Button(context, '', 'Sign Up', colors.buttonGreen,
                      auth.signUpEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
