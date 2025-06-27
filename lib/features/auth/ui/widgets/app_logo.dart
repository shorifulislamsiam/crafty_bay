import 'package:flutter_svg/flutter_svg.dart';
import "package:flutter/material.dart";

Widget appLogo({double? height, double? width}){
  return SvgPicture.asset("assets/images/logo.svg",height: height,width: width,);
}