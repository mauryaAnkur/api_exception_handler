import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget errorScreen(String error) {
  return Container(
    child: Center(child: Text(error)),
  );
}

Widget loadingScreen() {
  return Container(
    child: Center(child: CupertinoActivityIndicator()),
  );
}

Widget networkErrorScreen(String error) {
  return Container(
    child: Center(child: Text(error)),
  );
}