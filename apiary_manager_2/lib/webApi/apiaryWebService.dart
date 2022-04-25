import 'package:apiary_manager_2/model/HiveData.dart';
import 'package:http/http.dart' as http;

import '../model/ApiaryData.dart';

const String host = "http://192.168.1.134:8000";
const Map<String, String> basicHeaders = {
  'Content-Type': 'application/json',
  'Access-Control-Allow-Origin': '*'
};

Future<List<Apiary>?> getApiaryList() async {
  var url = Uri.parse('$host/api/apiary/list?format=json');
  var response = await http.get(
    url,
    headers: basicHeaders,
  );
  if (response.statusCode == 200) {
    return apiariesFromJson(response.body);
  } else {
    requestFailed(response);
  }
  return null;
}

Future<Apiary?> getApiaryDetails(int apiaryId) async {
  var url = Uri.parse('$host/api/apiary/detail/$apiaryId?format=json');
  var response = await http.get(
    url,
    headers: basicHeaders,
  );
  if (response.statusCode == 200) {
    return apiaryFromJson(response.body);
  } else {
    requestFailed(response);
  }
  return null;
}

Future<List<Hive>?> getHiveList(int apiaryId) async {
  var url = Uri.parse('$host/api/hive/hivesOfApiary/$apiaryId?format=json');
  var response = await http.get(
    url,
    headers: basicHeaders,
  );
  if (response.statusCode == 200) {
    return hivesFromJson(response.body);
  } else {
    requestFailed(response);
  }
  return null;
}

void requestFailed(http.Response response) {
  print('Request failed with status: ${response.statusCode}.');
}
