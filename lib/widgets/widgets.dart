import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BuildContext context;
  final String image;
  final String text;
  final Color backColor;
  final String navigateTo;
  final VoidCallback callback;

  Button(this.context, this.image, this.text, this.backColor, this.callback,this.navigateTo);



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
        onTap: (){
          if(navigateTo!='' && navigateTo!='/home' )
          Navigator.of(context).pushNamed(navigateTo);
          else if (navigateTo =='/home'){
            Navigator.of(context).pushNamedAndRemoveUntil(navigateTo,ModalRoute.withName(''));
          }
          else callback();
        },
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


class FilterButton extends StatefulWidget {
  final BuildContext context;
  final String text;
  FilterButton(this.context,this.text);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.1,
      width: size.width*0.25,
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: selected?Colors.white:Colors.transparent,
      ),
      child: InkWell(
        onTap: (){
          setState(() {
            selected =!selected;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // if (image != '')
            //   Container(
            //     margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            //     height: size.height * 0.05,
            //     child: Image.asset(image),
            //   ),
            Container(
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 13, color: selected?AppColors().backColor:Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget event(BuildContext context, String title, String subtitle){
  void navigate(){}
  Size size = MediaQuery.of(context).size;
  return InkWell(
    onTap: (){
      Navigator.of(context).pushNamed('/event');
    },
    child: Container(
      height: size.height*0.1,
      padding: EdgeInsets.all(10),
      child:Row(children: [
        Container(
          height: size.height*0.07,
          width: size.height*0.07,
          color: Colors.grey,
        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(title, style: Theme.of(context).textTheme.headline6),
          Text(subtitle),
        ],),Spacer(),
        Container(
          height: size.height*0.06,
          width: size.width*0.3,
          decoration: BoxDecoration(
            // border: Border.all(color:Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Button(context,'','BOOK',AppColors().googleBlue,navigate,'/event'),
        )
      ],)
    ),
  );
}


Widget editText(BuildContext context, String name, Widget child) {
  Size size = MediaQuery.of(context).size;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
