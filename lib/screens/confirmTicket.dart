import 'package:flutter/material.dart';

class ConfirmTicket extends StatelessWidget {
  const ConfirmTicket({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Confirm Details'),
        ),
      body: Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: size.height * 0.11,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.only(bottom: size.height * 0.01),
                      child: Text('Hardy Sandhu',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    Text('8:00pm - 10:00pm'),
                    Text('Concert Ground')
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: size.height * 0.06,
                        child: Text(
                          '14',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        )),
                    Text('Feb',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
        ],),
      ),
    );
  }
}
