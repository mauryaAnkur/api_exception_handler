
import 'package:example/api/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future getDataFromApi() {
    return _provider.getData();
  }
}