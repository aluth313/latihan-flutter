import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  String name;
  String job;
  String id;
  String createdAt;

  PostResult({this.id, this.name, this.job, this.createdAt});
  
  factory PostResult.createPostResult(Map<String, dynamic> object){
    return PostResult(
      id: object["id"],
      name: object["name"],
      job: object["job"],
      createdAt: object["createdAt"],
    );
  }

  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL = "https://reqres.in/api/users/2";
    
    var apiResult = await http.put(apiURL, body: {
      "name": name,
      "job": job,
    });
    // var apiResult = await http.post(apiURL, body: {
    //   "name": name,
    //   "job": job,
    // });
    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}