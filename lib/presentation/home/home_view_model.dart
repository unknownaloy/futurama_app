import 'package:flutter/cupertino.dart';
import 'package:futurama_app/presentation/home/union/home_request_state.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/utilities/failure.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiServices _apiServices;

  HomeViewModel({required ApiServices apiServices})
      : _apiServices = apiServices;

  HomeRequestState _requestState = const HomeRequestState.idle();
  HomeRequestState get requestState => _requestState;

  Future<void> fetchInfoData() async {
    try {
      _requestState = const HomeRequestState.idle();

      final infoData = await _apiServices.getInfo();

      _requestState = HomeRequestState.success(infoData);
    } on Failure catch (err) {
      _requestState = HomeRequestState.error(message: err.message);
    } finally {
      notifyListeners();
    }
  }
}
