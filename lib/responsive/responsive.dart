import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttergram/helper.dart';
import 'package:fluttergram/responsive/mobilelayout.dart';
import 'package:fluttergram/responsive/weblayout.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({super.key, required this.mobileScreenLayout, required this.webScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if (constraints.maxWidth > webScreenSize){
          return WebLayout();
      }
      return MobileLayout();
    });
  }
}