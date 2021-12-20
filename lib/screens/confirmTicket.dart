import 'dart:io';

import 'package:engifest_22/helper/colors.dart';
import 'package:engifest_22/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';


class ConfirmTicket extends StatelessWidget {
  const ConfirmTicket({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    final pdf = pw.Document();
    writeOnPdf(){
      pdf.addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context){
            return pw.Column(
                children: [
                  pw.Container(
                    // pw.margin: EdgeInsets.symmetric(horizontal: 20),
                    height: size.height * 0.11,
                    child: pw.Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        pw.Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding:
                              pw.EdgeInsets.only(bottom: size.height * 0.01),
                              child: pw.Text('Live Concert',
                                  // style: Theme.of(context).textTheme.headline6
                              ),
                            ),
                            pw.Text('8:00pm - 10:00pm'),
                            pw.Text('Concert Ground')
                          ],
                        ),
                        pw.Spacer(),
                        pw.Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            pw.Container(
                                height: size.height * 0.06,
                                child: pw.Text(
                                  '14',
                                  style: pw.TextStyle(
                                      fontSize: 40, ),
                                )),
                            pw.Text('Feb',
                                style: pw.TextStyle(
                                    fontSize: 20, ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  pw.Container(
                    height: size.height*0.6,
                    width: size.width,
                    margin: pw.EdgeInsets.fromLTRB(20, 20, 20,20),
                    padding: pw.EdgeInsets.all(30),
                    // decoration: pw.BoxDecoration(
                    //   // color: AppColors().secBackColor,
                    //   // borderRadius: BorderRadius.all(Radius.circular(20),),
                    // ),
                    child: pw.Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          // margin: pw.EdgeInsets.fromLTRB(0, 0, 0,20),
                          // child: pw.Image(),
                        ),
                        // Container(child: Text('Details', style: Theme.of(context).textTheme.headline6,)),
                        pw.Container(child: pw.Text('Haresh Nayak')),
                        pw.Container(child: pw.Text('hareshnayak018@gmail.com')),
                        pw.Container(child: pw.SizedBox(height: 10,)),
                        pw.Container(child: pw.Text('Delhi Technological University', style: pw.TextStyle(fontSize: 17, ))),
                        pw.Container(child: pw.Text('3rd, ECE')),
                      ],
                    ),
                  ),
                ]
            );
          }));
    }

    Future savePdf() async {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      File file = File("$appDocPath/ticket.pdf");
      pdf.save();
      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save());
      Navigator.of(context).pushNamed('/pdfViewer',arguments: {
        pdf: pdf
      });
    }

    void navigate(){
      writeOnPdf();
      savePdf();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Ticket Confirmed'),
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
                      child: Text('Live Concert',
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
            height: size.height*0.6,
            width: size.width,
            margin: EdgeInsets.fromLTRB(20, 20, 20,20),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: AppColors().secBackColor,
                borderRadius: BorderRadius.all(Radius.circular(20),),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0,20),
                  child: Image.network('https://i.stack.imgur.com/YLy3V.png'),
              ),
                // Container(child: Text('Details', style: Theme.of(context).textTheme.headline6,)),
                Container(child: Text('Haresh Nayak')),
                Container(child: Text('hareshnayak018@gmail.com')),
                Container(child: SizedBox(height: 10,)),
                Container(child: Text('Delhi Technological University', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
                Container(child: Text('3rd, ECE')),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0,0,20,20),
            child: Button(context,'','Download Ticket (.pdf)',AppColors().buttonGreen,navigate,''),
          )
        ],),
      ),
    );
  }
}
