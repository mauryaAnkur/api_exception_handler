import 'dart:convert';

import 'package:api_exception_handler/API%20Handler/base_client.dart';
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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Response Handler'),
      ),
      body: APIResponseHandler(
        function: [getData()],
        successScreen: (data) {
          return Text(data!.data[0].toString());
        },
        errorScreen: (data) {
          print('error data ==  $data');
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.toString()),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    /// simply call setState(() {}) to refresh the data.
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: const Text('Retry', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          );
        },
        networkErrorScreen: const Text('Cannot establish connection with server!!'),
        loadingScreen: const Center(
          child: CupertinoActivityIndicator(radius: 20,),
        ),
      ),
    );
  }
}


Future<void> getData() async {
  var response = await BaseClient().get(url: 'https://api.mindbodyonline.com');
  print(response.body);
}

Future fetchData() async {
  // String url = 'https://api.covid19api.com/summary/mm';
  // String url = 'https://api.mindbodyonline.com/public/v6/sale/giftcards';
  String url = 'https://api.mindbodyonline.com/asd';

  final parameters = {
    '': '',
  };

  var response = await BaseClient().get(url: url, queryParameters: parameters);
  var data = json.decode(response);

  return data;
}