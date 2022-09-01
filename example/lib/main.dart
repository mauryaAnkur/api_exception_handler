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
      appBar: AppBar(
        title: Text('API Response Handler'),
      ),
      body: Container(
        child: APIResponseHandler(
          function: fetchData(),
          successScreen: (data) {
            // return Container(
            //   child: Text(data.toString()),
            // );

            print('dataa ==== ${data}');
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data?.data.length as int,
                    itemBuilder: (context, index) {
                      // return Container();
                      return itemsCard(index, context, data?.data[index]);
                    }),
              ),
            );
          },
          errorScreen: (data) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.toString()),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Text('Retry', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
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

  Widget itemsCard(index, context, Coin coin) {

    double oldPrice = coin.coinLastPrice.isEmpty ? double.parse(coin.coinPrice) : double.parse(coin.coinLastPrice);
    coin.coinLastPrice = coin.coinPrice;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(vertical: height * 0.003),
            padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.014),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(coin.coinImage, height: width * 0.085, width: width * 0.085, fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(
                            height: width * 0.083,
                            width: width * 0.083,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade400, width: 1)
                            ),
                            child: Center(
                              child: Text(
                                  coin.coinName.isEmpty
                                      ? '-'
                                      : coin.coinName[0]),
                            ),
                          ),
                    ),
                    SizedBox(width: width * 0.014,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 0.24,
                          child: Row(
                            children: [
                              Text(coin.coinShortName + " / ", style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.bodyText1!.color, fontWeight: FontWeight.w700),),
                              Text(coin.coinPairWith, style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.bodyText2!.color, fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.005,),
                        Text(coin.coinName, style: TextStyle(color: Theme.of(context).textTheme.bodyText2!.color, fontSize: 10),)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.22,
                  child: Text(
                    coin.coinPairWith.toLowerCase() == 'inr'
                        ? (double.parse(coin.coinPrice.toString()) * 79.0).toStringAsFixed(int.parse(coin.coinDecimalPair))
                        : double.parse(coin.coinPrice.toString()).toStringAsFixed(int.parse(coin.coinDecimalPair)),
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      color: double.parse(coin.coinPrice) > oldPrice ? Colors.lightGreen : double.parse(coin.coinPrice) < oldPrice ? Colors.red : Theme.of(context).textTheme.bodyText1!.color ,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.16,
                  color: coin.coinPercentage.toString().startsWith('-') ? Colors.red : Colors.lightGreen,
                  padding: const EdgeInsets.all(4),
                  child: Center(child: FittedBox(child: Text(coin.coinPercentage + '%', style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w700),))),
                  //child: Text(percent + '%', style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w700),),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}

Future fetchData() async {
  // var response = await BaseClient().get('https://app.nodeadscoin.com/backend/public/api/orders/get');  ///---  not found  ---///
  // var response = await BaseClient().get('https://server.finexnode.com/user-crypto/get');   ///---  unAuthenticated  ---///
  var response = await BaseClient().get('https://server.finexnode.com/list-crypto/get');   ///---  working  ---///

  var data = json.decode(response);

  ///
  List<Coin> coinsList = [];

  if(data['status_code'].toString() == '1') {

    for(var i=0; i<data['data'].keys.length; i++) {
      for(var j=0; j<data['data'][data['data'].keys.elementAt(i).toString()].length; j++) {

        coinsList.add(Coin(
          coinID: data['data'][data['data'].keys.elementAt(i).toString()][j]['id'].toString(),
          coinImage: data['data'][data['data'].keys.elementAt(i).toString()][j]['image'].toString(),
          coinName: data['data'][data['data'].keys.elementAt(i).toString()][j]['name'].toString(),
          coinShortName: data['data'][data['data'].keys.elementAt(i).toString()][j]['currency'].toString(),
          coinPrice: data['data'][data['data'].keys.elementAt(i).toString()][j]['price'].toString(),
          coinLastPrice: data['data'][data['data'].keys.elementAt(i).toString()][j]['price'].toString(),
          coinPercentage: data['data'][data['data'].keys.elementAt(i).toString()][j]['change'].toString(),
          coinSymbol: data['data'][data['data'].keys.elementAt(i).toString()][j]['symbol'].toString(),
          coinPairWith: data['data'][data['data'].keys.elementAt(i).toString()][j]['pair_with'].toString(),
          coinHighDay: data['data'][data['data'].keys.elementAt(i).toString()][j]['high'].toString(),
          coinLowDay: data['data'][data['data'].keys.elementAt(i).toString()][j]['low'].toString(),
          coinDecimalPair: data['data'][data['data'].keys.elementAt(i).toString()][j]['decimal_pair'].toString(),
          coinDecimalCurrency: data['data'][data['data'].keys.elementAt(i).toString()][j]['decimal_currency'].toString(),
          coinListed: data['data'][data['data'].keys.elementAt(i).toString()][j]['listed'] as bool,
        ));
      }
    }

    // ConstantClass.currencyList.insert(0, 'Wishlist');
    // ConstantClass.currencyList.insert(ConstantClass.currencyList.length + 1, 'P2P');


    return coinsList;

  }
  else {
    // ToastMessage.showToast( 'Something went wrong!!', Colors.red);
    return coinsList;
  }
  ///


  // return data;
}



class Coin {
  String coinID;
  String coinImage;
  String coinName;
  String coinShortName;
  String coinPrice;
  String coinLastPrice;
  String coinPercentage;
  String coinSymbol;
  String coinPairWith;
  String coinHighDay;
  String coinLowDay;
  String coinDecimalPair;
  String coinDecimalCurrency;
  bool coinListed;

  Coin({
    required this.coinID,
    required this.coinImage,
    required this.coinName,
    required this.coinShortName,
    required this.coinPrice,
    required this.coinLastPrice,
    required this.coinPercentage,
    required this.coinSymbol,
    required this.coinPairWith,
    required this.coinHighDay,
    required this.coinLowDay,
    required this.coinDecimalPair,
    required this.coinDecimalCurrency,
    required this.coinListed,
  });
}