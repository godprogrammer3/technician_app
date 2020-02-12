import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  const LoadingWidget({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (this.width == null && this.height == null) {
        return CircularProgressIndicator(
          backgroundColor: Color.fromARGB(255, 47, 220, 150),
        );
      } else if (this.width == null) {
        return Container(
          padding: EdgeInsets.all(10.0),
          height: this.height,
          width: constraints.maxWidth,
          child: CircularProgressIndicator(
            backgroundColor: Colors.green[200],
          ),
        );
      } else if (this.height == null) {
        return Container(
          padding: EdgeInsets.all(10.0),
          height: constraints.maxHeight,
          width: this.width,
          child: CircularProgressIndicator(
            backgroundColor: Colors.green[200],
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.all(10.0),
          height: this.height,
          width: this.width,
          child: CircularProgressIndicator(
            backgroundColor: Colors.green[200],
          ),
        );
      }
    });
  }
}
