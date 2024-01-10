import 'dart:convert';
import 'package:batch4/AlbumApp/Model/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  
  Future postAlbumService(
      {required String email, required String password}) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    Uri uri = Uri.parse('https://staging-api.allout.ae/api/v1/auth/signIn');
    http.Response response = await http.post(uri,
        headers: <String, String>{
          "Accept": "*/*",
          "Content-Type": "application/json",
          // "Autherization":"Bearer Your Access Token",
        },
        body: jsonEncode(data));
    print("Response");
    print(jsonDecode(response.body)["data"]["user"]["_id"]);
    print(jsonDecode(response.body)["data"]["token"]);
    print(response.statusCode);
  }

  Future<List<Album>> getAlbumsService() async {
    List<Album> albums = [];

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    http.Response response = await http.get(
      uri,
      headers: <String, String>{
        "Accept": "*/*",
        "Content-Type": "application/json",
        // "Autherization":"Bearer Your Access Token",
      },
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      albums = Album.jsonToModelList(jsonDecode(response.body));
    }

    return albums;
  }

  Future updateAlbumService(
      {required String email, required String password}) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    Uri uri = Uri.parse('https://staging-api.allout.ae/api/v1/auth/signIn');

    http.Response response = await http.put(uri,
        headers: <String, String>{
          "Accept": "*/*",
          "Content-Type": "application/json",
          // "Autherization":"Bearer Your Access Token",
        },
        body: jsonEncode(data));
    print("Response");
    print(jsonDecode(response.body)["data"]["user"]["_id"]);
    print(jsonDecode(response.body)["data"]["token"]);
    print(response.statusCode);
  }

  Future patchRequest({required String email, required String password}) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    Uri uri = Uri.parse('https://staging-api.allout.ae/api/v1/auth/signIn');
    http.Response response = await http.patch(uri,
        headers: <String, String>{
          "Accept": "*/*",
          "Content-Type": "application/json",
          // "Autherization":"Bearer Your Access Token",
        },
        body: jsonEncode(data));
    print("Response");
    print(jsonDecode(response.body)["data"]["user"]["_id"]);
    print(jsonDecode(response.body)["data"]["token"]);
    print(response.statusCode);
  }

  Future deleteRequest({required String id}) async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/albums/$id');

    http.Response response = await http.delete(
      uri,
      headers: <String, String>{
        "Accept": "*/*",
        "Content-Type": "application/json",
        // "Autherization":"Bearer Your Access Token",
      },
    );
    print("Response");
    print(jsonDecode(response.body)["data"]["user"]["_id"]);
    print(jsonDecode(response.body)["data"]["token"]);
    print(response.statusCode);
  }




}
