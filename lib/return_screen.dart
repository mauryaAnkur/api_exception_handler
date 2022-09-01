import 'package:flutter/material.dart';


class APIResponseHandler extends StatelessWidget {

  final Future<Object?>? function;
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
      future: function,
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData) {
          print('snapshot ====>>   ${snapshot.data}');
          return successScreen!(snapshot);
          // return Center(child: Text(snapshot.data.toString()));
        } else if(snapshot.hasError) {
          return errorScreen!(snapshot.error);
          // return Center(child: Text(snapshot.error.toString()));
        } else if(snapshot.connectionState == ConnectionState.waiting) {
          return loadingScreen;
          // return const Center(child: Text('Waiting....'));
        } else if(snapshot.connectionState == ConnectionState.none) {
          return networkErrorScreen;
          // return const Center(child: Text('Cannot establish connection with server!!'));
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
