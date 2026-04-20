import 'dart:convert';
import 'package:elyoum_elsa2e3/api/api_constants.dart';
import 'package:elyoum_elsa2e3/api/end_points.dart';
import 'package:elyoum_elsa2e3/models/news_response.dart';
import 'package:elyoum_elsa2e3/models/source_response.dart';
import 'package:http/http.dart' as http;
class ApiManager {
  static Future<SourceResponse> getSources() async {
    try{
      Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.endPoint,{
        "apiKey" : ApiConstants.apiKey
      });
      var response = await http.get(url);
      var responseBody = response.body;
      return SourceResponse.fromJson(jsonDecode(responseBody));
    }catch(e){
      rethrow;
    }
  }

  static Future<SourceResponse> getSourcesByCategory(String category) async {
    try{
      Uri url = Uri.https(ApiConstants.baseUrl,EndPoints.endPoint,{
        "apiKey" : ApiConstants.apiKey,
        "category" : category
      });
      var response = await http.get(url);
      var responseBody = response.body;
      return SourceResponse.fromJson(jsonDecode(responseBody));
    }catch(e){
      rethrow;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try{
      Uri url = Uri.https(
          ApiConstants.baseUrl,
          EndPoints.everythingEndPoint,
          {
            "apiKey" : ApiConstants.apiKey,
            "sources" : sourceId
          }
      );
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      rethrow;
    }
  }
}