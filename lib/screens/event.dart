import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void confirm() {}
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Live Concert'),
      ),
      body: Container(
        height: size.height * 0.9,
        width: size.width,
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: size.height * 0.02),
                  height: size.height * 0.45,
                  width: size.width,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20
                  ),
                  height: size.height * 0.5,
                  color: Colors.transparent,
                  child: Text('Hardavinder Singh "Harrdy" Sandhu, is an Indian singer, actor and former cricketer.[2] His first song was Tequilla Shot, and he gained popularity with Soch (2013) and Joker (2014), which were written by Jaani and music composed by B Praak .\n\n Hardavinder Singh "Harrdy" Sandhu, is an Indian singer, actor and former cricketer.[2] His first song was Tequilla Shot, and he gained popularity with Soch (2013) and Joker (2014), which were written by Jaani and music composed by B Praak .'),
                )
              ],
            ),
            Positioned(
                bottom: 0,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.105,
                      width: size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment(0,-3),
                          colors: <Color>[
                            AppColors().backColor,
                            Color(0x00000000)
                          ], // red to yellow
                        ),
                      ),
                    ),
              Positioned(
                left: size.width * 0.05,
                bottom: 10,child: Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width * 0.9,
                      child: Button(context, '', 'Book Ticket',
                          AppColors().buttonGreen, confirm, '/confirmTicket'),
                    ),),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
