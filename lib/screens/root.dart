import 'package:engifest_22/database/auth.dart';
import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/screens/signUp.dart';
import 'package:engifest_22/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  RootPage({Key key}) : super(key: key);

  final AppColors colors = AppColors();
  final Auth auth = Auth();

  void navigateToLogin(){}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: size.height * 0.2,
              margin: EdgeInsets.fromLTRB(
                  0, size.height * 0.15, 0, size.height * 0.05),
              child: Image.asset('assets/images/engi_logo.png'),
            ),
            Container(
              child: Text(
                'Engifest 2022',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: size.height * 0.1),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: Button(context, 'assets/images/google_icon.png',
                    'Login with Google', colors.googleBlue, auth.loginGoogle,''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                  child: Button(context, '', 'Login with email',
                      colors.buttonGreen, navigateToLogin,'/login')),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('Don\'t have an account? Sign up'),
                alignment: Alignment.bottomRight,
              ),
            ),
            Spacer(),
            cc()
          ],
        ),
      ),
    );
  }
}
