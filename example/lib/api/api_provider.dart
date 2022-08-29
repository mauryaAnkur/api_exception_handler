
import 'dart:convert';
import 'dart:developer';

import 'package:api_exception_handler/API%20Handler/BaseClient.dart';

const String _url = 'https://api.covid19api.com/summary';

class ApiProvider {

  Future getData() async {
    // try {
    //   var response = await http.get(Uri.parse(_url));
    //   var data = json.decode(response.body);
    //   print('data =====>>?   ${data}');
    //   return CovidModel.fromJson(data);
    // } catch (error, stacktrace) {
    //   print("Exception occured: $error stackTrace: $stacktrace");
    //   return CovidModel.withError("Data not found / Connection issue");
    // }


    var response = await BaseClient().get(_url);

    var data = json.decode(response);
    log('data123456789 ====>>>   ${response}');

    // return data;
    // coinsList = Coin.fromJson(data);
    return data;

  }

}