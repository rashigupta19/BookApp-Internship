import 'package:http/http.dart' as http;
import 'dart:convert' as jsonconvert;

import 'package:myknott/model/Lead.dart';

class ApiClient {
  void postData(Function successCallBack, Function failCallBack) async {
    const URL = "https://notaryapi1.herokuapp.com/lead/getLeads";
    Future<http.Response> future = http.post(Uri.parse(URL),
        body: {"notaryId": "62421089c913294914a8a35f"}); //or post url
    future.then((response) {
      String json = response.body;
      print("$json");
      Map<String, dynamic> map = jsonconvert.jsonDecode(json);
      List<dynamic> list = map['leads'];
      print("$list");
      List<Lead> leads = list.map((songMap) => Lead.fromJson(songMap)).toList();
      print("Songs are $leads");

      successCallBack(leads);
    }).catchError((err) => failCallBack(err));
  }
}
