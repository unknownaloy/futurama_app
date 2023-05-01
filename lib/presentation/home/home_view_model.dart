import 'package:flutter/cupertino.dart';
import 'package:futurama_app/data/models/info/info_model.dart';
import 'package:futurama_app/data/unions/request_state.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/utilities/failure.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiServices _apiServices;

  HomeViewModel({required ApiServices apiServices})
      : _apiServices = apiServices;

  RequestState _requestState = const RequestState.idle();
  RequestState get requestState => _requestState;

  InfoModel? _infoData;
  InfoModel? get infoData => _infoData;

  Future<void> fetchInfoData() async {
    try {
      _requestState = const RequestState.loading();

      _infoData = await _apiServices.getInfo();

      _requestState = const RequestState.success();
    } on Failure catch (err) {
      _requestState = RequestState.error(message: err.message);
    } finally {
      notifyListeners();
    }
  }
}
