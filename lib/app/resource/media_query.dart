import 'package:flutter/material.dart';

class MediaQueryResfonsive {
  final BuildContext context;
  MediaQueryResfonsive(this.context);
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  double get appBarHeight => AppBar().preferredSize.height;
  double get statusBarHeight => MediaQuery.of(context).padding.top;
  double get bodyHeight {
    return height - statusBarHeight - appBarHeight;
  }
}
