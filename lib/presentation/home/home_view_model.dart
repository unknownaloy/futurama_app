import 'package:flutter/cupertino.dart';
import 'package:futurama_app/data/models/info/info_model.dart';
import 'package:futurama_app/data/unions/request_state.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/utilities/failure.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiServices _apiServices;

  HomeViewModel({required ApiServices apiServices})
      : _apiServices = apiServices;

  RequestState<InfoModel> _requestState = const RequestState<InfoModel>.idle();
  RequestState<InfoModel> get requestState => _requestState;

  Future<void> fetchInfoData() async {
    try {
      _requestState = const RequestState.idle();

      final data = await _apiServices.getInfo();

      _requestState = RequestState<InfoModel>.success(data);
    } on Failure catch (err) {
      _requestState = RequestState.error(message: err.message);
    } finally {
      notifyListeners();
    }
  }
}
