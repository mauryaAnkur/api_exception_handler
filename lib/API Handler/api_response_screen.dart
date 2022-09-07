/// API Response output

import 'package:flutter/cupertino.dart';

class APIResponseHandler extends StatelessWidget {
  final Iterable<Future>? function;
  final Widget Function(AsyncSnapshot?)? successScreen;
  final Widget loadingScreen;
  final Widget networkErrorScreen;
  final Widget Function(Object?)? errorScreen;

  const APIResponseHandler({
    this.function,
    required this.successScreen,
    required this.loadingScreen,
    required this.networkErrorScreen,
    required this.errorScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait(function!),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return successScreen!(snapshot);
        } else if (snapshot.hasError) {
          return errorScreen!(snapshot.error);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingScreen;
        } else if (snapshot.connectionState == ConnectionState.none) {
          return networkErrorScreen;
        }
        return const Center(
          child: CupertinoActivityIndicator(
            radius: 18,
          ),
        );
      },
    );
  }
}
