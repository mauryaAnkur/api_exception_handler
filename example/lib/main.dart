import 'dart:convert';

import 'package:api_exception_handler/API%20Handler/BaseClient.dart';
import 'package:api_exception_handler/api_exception_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: APIResponseHandler(
          function: fetchData(),
          successScreen: (data) {
            return Container(
              child: Text(data.toString()),
            );
          },
          errorScreen: (data) {
            return Container(
              child: Text(data.toString()),
            );
          },
          networkErrorScreen: Container(
            child: Text('Cannot establish connection with server!!'),
          ),
          loadingScreen: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }
}

Future fetchData() async {
  // var response = await BaseClient().get('https://app.nodeadscoin.com/backend/public/api/orders/get');  ///---  not found  ---///
  // var response = await BaseClient().get('https://server.finexnode.com/user-crypto/get');   ///---  unAuthenticated  ---///
  var response = await BaseClient().get('https://server.finexnode.com/list-crypto/get');   ///---  unAuthenticated  ---///

  var data = json.decode(response);
  // log('data ====>>>   ${response}');

  return data;
  // coinsList = Coin.fromJson(data);
  // return Coin.fromJson(data);
}