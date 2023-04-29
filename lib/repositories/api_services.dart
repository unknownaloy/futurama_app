import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:futurama_app/data/models/info/info_model.dart';
import 'package:futurama_app/utilities/failure.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  final http.Client _client;

  ApiServices({required http.Client client}) : _client = client;

  final Duration _timeOutDuration = const Duration(seconds: 60);

  Future<InfoModel> getInfo() async {
    try {
      final url = Uri.parse("https://api.sampleapis.com/futurama/info");

      debugPrint("ApiServices - getInfo -- url -> $url");

      final response = await _client.get(url).timeout(_timeOutDuration);

      debugPrint(
          "ApiServices - getInfo -- response.statusCode -> ${response.statusCode}");

      if (response.statusCode >= 200 && response.statusCode <= 304) {
        final decodedData = jsonDecode(response.body);

        debugPrint("ApiService - getInfo -- decodedData -> $decodedData");

        InfoModel info = InfoModel.fromJson(decodedData[0]);

        debugPrint("ApiService - getInfo -- info -> ${info.toJson()}");
        return info;
      } else {
        throw Failure("Couldn't get data. Please try again");
      }
    } on SocketException catch (_) {
      throw Failure("No internet connection");
    } on HttpException {
      throw Failure("Service not currently available");
    } on TimeoutException catch (_) {
      throw Failure("Poor internet connection");
    } on Failure catch (e) {
      throw Failure(e.message);
    } on TypeError catch (e) {
      throw Failure("Data not available at the moment");
    } catch (e) {
      throw Failure("Something went wrong. Try again");
    }
  }
}
