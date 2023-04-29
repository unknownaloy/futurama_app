import 'package:flutter/cupertino.dart';
import 'package:futurama_app/data/enums/request_state.dart';
import 'package:futurama_app/data/models/info/info_model.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/utilities/failure.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiServices _apiServices;

  HomeViewModel({required ApiServices apiServices})
      : _apiServices = apiServices;

  RequestState _requestState = RequestState.idle;
  RequestState get requestState => _requestState;

  InfoModel? _infoData;
  InfoModel? get infoData => _infoData;

  Future<void> fetchInfoData() async {
    try {
      _requestState = RequestState.loading;

      _infoData = await _apiServices.getInfo();

      _requestState = RequestState.success;
    } on Failure catch (err) {
      _requestState = RequestState.failure;
    } finally {
      notifyListeners();
    }
  }
}
