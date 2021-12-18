import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/widgets/widgets.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Engifest 2022'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            height: size.height * 0.3,
            width: size.width,
            decoration: BoxDecoration(color: Colors.grey),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0,0,10,0),
              child: Row(
                children: [
                  Text('Upcoming Events',
                      style: Theme.of(context).textTheme.headline6),
                  Spacer(),
                  Text('View All',),
                ],
              ),
            ),
          ),
          Container(
            height: size.height*0.04,
            width: size.width,
            margin: EdgeInsets.fromLTRB(0, 10, 0,0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterButton(context, 'Music'),
                FilterButton(context, 'Theatre'),
                FilterButton(context, 'Sports'),
                FilterButton(context, 'Debate'),
              ],
            ),
          ),
          Container(
            height: size.height*0.44,
            width: size.width,
            margin: EdgeInsets.fromLTRB(0, 10, 0,0),
            decoration: BoxDecoration(
              color: AppColors().secBackColor,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                event(context, 'Live Concert','Hardy Sandhu'),
                event(context, 'Live Concert','Hardy Sandhu'),
                event(context, 'Live Concert','Hardy Sandhu'),
                event(context, 'Live Concert','Hardy Sandhu'),
                event(context, 'Live Concert','Hardy Sandhu'),
                event(context, 'Live Concert','Hardy Sandhu'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
