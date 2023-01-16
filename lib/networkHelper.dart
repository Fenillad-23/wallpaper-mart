// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String API_KEY = "563492ad6f917000010000014df6eddfa02143fd9ceb352dc4e9ffa2";
  String baseUrl = "https://api.pexels.com/v1/curated?per_page=79&page=1";
  HttpGet(String pagination) async {
    var baseUrl = Uri.parse(
        "https://api.pexels.com/v1/curated?per_page=79&page=$pagination");
    dynamic response = await http.get(baseUrl);
    print(response);
  }
}
