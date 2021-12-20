import 'package:engifest_22/database/api_service.dart';
import 'package:engifest_22/database/auth.dart';
import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/mixins/validation_mixin.dart';
import 'package:engifest_22/modal/login_modal.dart';
import 'package:engifest_22/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  final AppColors colors = AppColors();
  final Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  void forgotPass() {}

  @override
  Widget build(BuildContext context) {
    void login() {
      validateAndSave();
      setState(() {
        if (validateAndSave()) {
          loading = true;
        }});
      print(requestModel.email + '  '+ requestModel.password);
      API apiService = new API();
      apiService.login(requestModel).then((value) {
        setState(() {
          auth.loggedIn = true;
          loading = false;
        });
      }).then((value){Navigator.of(context)
          .pushNamedAndRemoveUntil('/home', ModalRoute.withName('false'));});
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: size.height*0.007,
            width: size.width,
            child: loading?LinearProgressIndicator():null,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Form(
              key: _formKey,
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
                      'Login with email',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: editText(
                      context,
                      'Email',
                      TextFormField(
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            !value.contains("@") ? "Enter a valid email" : null,
                        onSaved: (value) {
                          setState(() {
                            requestModel.email = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: 'someone@company.com',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: editText(
                          context,
                          'Password',
                          TextFormField(
                            obscureText: true,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            validator: (value) => value.length < 8
                                ? "Min. Password length should be 8"
                                : null,
                            onSaved: (value) {
                              setState(() {
                                requestModel.password = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: '***',),
                          ))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Center(
                        child: Button(
                            context, '', 'Login', colors.buttonGreen, login, '')),
                  ),
                  InkWell(
                    onTap: forgotPass,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text('Forgot Password?'),
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
