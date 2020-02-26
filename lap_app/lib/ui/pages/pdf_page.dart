import 'package:flutter/material.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:meta/meta.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';


// class PDFpage extends StatelessWidget{
//   // String urlPDF;
//   // PDFDocument document;
//   bool isLoading = false;

//   @override
//     Widget build(BuildContext context) {
//       PDFDocument doc = getPDF();
//       return
//       Scaffold(
//           appBar: AppBar(
//             title: Text('Example'),
//           ),
//           body: Center(
//           child: 
//               isLoading? 
//               Center(child: CircularProgressIndicator()) : 
//               PDFViewer(document: doc
//               )),
//       );
//     }

//     Future<PDFDocument> getPDF()async{
//       return await 
//       PDFDocument.fromURL('http://www.africau.edu/images/default/sample.pdf');
//     }
// }

class Calendar2020PDFScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Calendar2020PDFScreenState();
}

class _Calendar2020PDFScreenState extends State<Calendar2020PDFScreen> {
  bool _isLoading = false, _isInit = true;
  PDFDocument document;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFromAssets();
    // this is where you load your asssets
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Center(
              child: Text(
            'MCHD',
            style: TextStyle(color: Colors.white),
          )),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // showSearch(context: context, delegate: DataSearch());
              },
            ) //IconButton
          ], //,Widget>[]
        ), //Appbar
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: _isLoading
                        ? Center(
                            child:
                                CircularProgressIndicator(), //Shows indicator if _isLoading is true
                          ) //Center
                        : PDFViewer(
                            document: document,
                          ), //PDFViewer
              ), //Center
            ), //Expanded
          ], //<Widget>[]
        ), //Column
      ), //Scaffold
    ); //MaterialApp
  }

  Future<PDFDocument> loadFromAssets() async {
    try {
      setState(() {
        _isLoading = true; //show loading
      });
      // document = await PDFDocument.fromAsset("assets/PDFs/calendars_2020.pdf");
      document = await PDFDocument.fromURL("https://www.cse.sc.edu/~jokane/agitr/agitr-letter.pdf");
      setState(() {
        _isLoading = false; //remove loading
      });
      return document;
    } catch (err) {
      print('Caught error: $err');
    } //catch
  } //Future
}