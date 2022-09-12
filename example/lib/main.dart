import 'dart:convert';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Response Handler'),
      ),
      body: APIResponseHandler(
        /// This function will behave as an
        /// asynchronous function
        function: [fetchData()],

        /// custom success screen
        successScreen: (data) {
          return Text(data!.data[0].toString());
        },

        /// custom error screen
        errorScreen: (data) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.toString()),
                const SizedBox(
                  height: 20,
                ),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },

        /// custom network error screen
        networkErrorScreen:
            const Text('Cannot establish connection with server!!'),

        /// custom loading screen
        loadingScreen: const Center(
          child: CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      ),
    );
  }
}

Future fetchData() async {
  String url = 'https://api.covid19api.com/summary/';

  final parameters = {
    '': '',
  };

  var response = await ApiHandler().get(url: url, queryParameters: parameters);
  var data = json.decode(response);

  return data;
}
