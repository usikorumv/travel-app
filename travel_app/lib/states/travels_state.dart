import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

import '../models/models.dart';

class TravelsState extends ChangeNotifier {
  LocalStorage storage = new LocalStorage('user');

  Future<List<TravelCard>> getTravelCards() async {
    String url = "http://127.0.0.1:8000/post/";

    List<TravelCard> travelCards = [];

    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });

      List data = json.decode(response.body);

      data.forEach((element) {
        travelCards.add(TravelCard.fromMap({
          'id': element["id"],
          'price': element["price"],
          'rating': element["rating"],
          'likes': element["likes"],
          'title': element["title"],
          'about': element["about"],
          'images': _getImagesUrl(element["images"] as List),
          'comments': _getComments(element["comments"] as List),
        }));
      });
    } catch (e) {
      print(e);
    }

    return travelCards;
  }

  Future<List<TravelCard>> getLikedTravelCards() async {
    String url = "http://127.0.0.1:8000/post/liked/";

    List<TravelCard> travelCards = [];

    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Token ${storage.getItem("token")}",
      });

      List data = json.decode(response.body);

      data.forEach((element) {
        travelCards.add(TravelCard.fromMap({
          'id': element["id"],
          'price': element["price"],
          'rating': element["rating"],
          'likes': element["likes"],
          'title': element["title"],
          'about': element["about"],
          'images': _getImagesUrl(element["images"] as List),
          'comments': _getComments(element["comments"] as List),
        }));
      });
    } catch (e) {
      print(e);
    }

    return travelCards;
  }

  Future like(int id) async {
    String url = "http://127.0.0.1:8000/post/likes/";

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Token ${storage.getItem("token")}",
          },
          body: jsonEncode({
            "pin": id,
          }));
    } catch (e) {
      print(e);
    }
  }

  Future unlike(int pin) async {
    String url = "http://127.0.0.1:8000/post/likes/";

    int id = -1;

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token ${storage.getItem("token")}",
        },
      );
      id = (json.decode(response.body) as List)
          .where((element) => element["pin"] == pin)
          .toList()[0];
    } catch (e) {
      print(e);
    }

    url = "http://127.0.0.1:8000/post/likes/$id/";

    try {
      http.Response response = await http.post(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Token ${storage.getItem("token")}",
      }, body: jsonEncode({
        "pin": id,
      }));
    } catch (e) {
      print(e);
    }
  }

  List<String> _getImagesUrl(List<dynamic> imagesResponse) {
    List<String> imagesUrl = [];

    imagesResponse.forEach((element) {
      imagesUrl.add(element["image"]);
    });

    return imagesUrl;
  }

  List<Comment> _getComments(List<dynamic> commentsResponse) {
    List<Comment> comments = [];

    commentsResponse.forEach((element) {
      comments.add(Comment.fromMap(element));
    });

    return comments;
  }

  Future<List<TravelCard>> getSearchedTravelCards(String toSearch) async {
    String url = "http://127.0.0.1:8000/post/search/?q=$toSearch";

    List<TravelCard> travelCards = [];

    try {
      http.Response response = await http.get(Uri.parse(url),headers: {
        "Content-Type": "application/json",
        "Authorization": "Token ${storage.getItem("token")}",
      });
      var data = json.decode(response.body);
      data.forEach((element) {
        travelCards.add(TravelCard.fromMap({
          'id': element["id"],
          'price': element["price"],
          'rating': element["rating"],
          'likes': element["likes"],
          'title': element["title"],
          'about': element["about"],
          'images': _getImagesUrl(element["images"] as List),
          'comments': _getComments(element["comments"] as List),
        }));
      });

    } catch (e) {
      print(e);
    }

    return travelCards;
  }
}
