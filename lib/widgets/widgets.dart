import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BuildContext context;
  final String image;
  final String text;
  final Color backColor;
  final VoidCallback callback;

  Button(this.context, this.image, this.text, this.backColor, this.callback);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      // width: size.width*0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: backColor,
      ),
      child: InkWell(
        onTap: callback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (image != '')
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                height: size.height * 0.05,
                child: Image.asset(image),
              ),
            Container(
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget editText(BuildContext context, String name, Widget child) {
  Size size = MediaQuery.of(context).size;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        Container(
          margin: EdgeInsets.fromLTRB(0,5, 0, 0),
          height: size.height * 0.08,
          width: size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: child,
        ),
      ],
    ),
  );
}

Widget cc() {
  return Container(
    child: Column(
      children: [
        Text(
          'Cultural Council',
          style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        Text('Delhi Technological University'),
      ],
    ),
  );
}
