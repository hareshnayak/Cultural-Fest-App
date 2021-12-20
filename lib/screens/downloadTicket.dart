import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';

class DownloadTicket extends StatelessWidget {
  const DownloadTicket({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void downloadTicket(){

    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Ticket Confirmed'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height*0.25,),
            Center(
              child: Container(
                height: size.height*0.3,
                child: Image.asset('assets/images/check.png'),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Button(context,'','Download Ticket (.pdf)',AppColors().buttonGreen,downloadTicket,'/home'),
            )
          ],
        ),
      ),
    );
  }
}
