import 'dart:async';
import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import 'urls.dart';
import 'shared.dart';

mixin ChipModel on Model {

  Future<dynamic> getAllAcitivityForHomePage() async {
    var statuscode;
    var message;
    try {
      print("Sending get all acitivty Request!");
      var user = await Shared.getUserDetails();
      http.Response response = await http.get(
        url_getDailyActivites,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer " + user.uid,
        },
      );
      print("Response for getting all activities:");
      print(response.statusCode);
      print(response.body);
      statuscode = response.statusCode;
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["payload"]["activities"];
      } else {
        if (response.statusCode == 500 ||
            response.statusCode == 400 ||
            response.statusCode == 404) {
          throw "Server Error!";
        } else {
          print("This wala error!");
          message = jsonDecode(response.body)["message"];
          // throw jsonDecode(response.body)["message"];
          throw message;
        }
      }
    } catch (err) {
      print("Error getting all activities for home page!....$err");
      return {"code": statuscode, "message": err};
    }
  }

  Future<dynamic> getArticles() async {
    var statuscode;
    var message;
    try {
      print("Sending get article Request!");
      http.Response response = await http.get(
        url_getArticles,
        headers: {"Content-type": "application/json"},
      );
      print("Response for getting articles:");
      print(response.statusCode);
      print(response.body);
      statuscode = response.statusCode;
      if (response.statusCode == 200) {
        var a = await getBaseArticles(jsonDecode(response.body));
        return a;
        // return jsonDecode(response.body);
      } else {
        if (response.statusCode == 500 ||
            response.statusCode == 400 ||
            response.statusCode == 404) {
          throw "Server Error!";
        } else {
          print("This wala error!");
          message = jsonDecode(response.body)["message"];
          // throw jsonDecode(response.body)["message"];
          throw message;
        }
      }
    } catch (err) {
      print("Error getting articles!....$err");
      return {"code": statuscode, "message": err};
    }
  }

  Future<dynamic> getBaseArticles(List arr) async {
    var statuscode;
    var message;
    var body = jsonEncode({"tokens": arr});
    try {
      print("Sending get base article Request!");
      http.Response response = await http.post(url_getBaseArticles,
          headers: {"Content-type": "application/json"}, body: body);
      print("Response for getting base articles:");
      print(response.statusCode);
      print(response.body);
      statuscode = response.statusCode;
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (response.statusCode == 500 ||
            response.statusCode == 400 ||
            response.statusCode == 404) {
          throw "Server Error!";
        } else {
          print("This wala error!");
          message = jsonDecode(response.body)["message"];
          throw message;
        }
      }
    } catch (err) {
      print("Error getting base articles!....$err");
      return {"code": statuscode, "message": err};
    }
  }

  Future<dynamic> sendDailyActivities({
    List<String> activityKeys,
    List<int> timeSpent,
    int moodIndex,
  }) async {
    var statuscode;
    var message;
    var rawBody = {};
    for (int i = 0; i < activityKeys.length; i++) {
      rawBody[activityKeys[i]] = timeSpent[i];
    }
    rawBody["feeling"] = moodIndex;
    var body = jsonEncode({
      "activities": rawBody,
    });
    var user = await Shared.getUserDetails();
    try {
      print("Sending get all acitivty Request!");
      http.Response response = await http.post(
        url_sendDailyActivites,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer " + user.uid,
        },
        body: body,
      );
      print("Response for sending daily activities:");
      print(response.statusCode);
      print(response.body);
      statuscode = response.statusCode;
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (response.statusCode == 500 ||
            response.statusCode == 400 ||
            response.statusCode == 404) {
          message = jsonDecode(response.body)["error"];
          throw message;
        } else {
          message = jsonDecode(response.body)["error"];
          throw message;
        }
      }
    } catch (err) {
      print("Error sending daily activities!....$err");
      throw message;
    }
  }
}
