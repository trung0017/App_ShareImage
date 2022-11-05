//responsive_layout_screen.dart dùng để xây dựng bố cục đáp ứng
import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout})
      : super(key: key);
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return webScreenLayout;
        }
        return mobileScreenLayout;
      },
    );
  }
}
