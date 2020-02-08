import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ImageDisplay extends StatelessWidget {
  final String imageName;
  final String assetPath = 'assets/images/';
  const ImageDisplay({Key key, 
    @required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if( imageName.contains(".svg")){
       return SvgPicture.asset(assetPath+imageName, semanticsLabel: 'svg img',);
    }else{
      return Image.asset(assetPath+imageName,fit: BoxFit.contain,);
    }
  }

}