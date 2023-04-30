import 'package:flutter/cupertino.dart';
import 'package:futurama_app/data/models/character/character.dart';
import 'package:futurama_app/data/unions/request_state.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/utilities/failure.dart';

class CharactersViewModel extends ChangeNotifier {
  final ApiServices _apiServices;

  CharactersViewModel({required ApiServices apiServices})
      : _apiServices = apiServices;

  RequestState<List<Character>> _requestState =
      const RequestState<List<Character>>.idle();
  RequestState<List<Character>> get requestState => _requestState;

  Future<void> fetchCharacters() async {
    try {
      _requestState = const RequestState.loading();

      final data = await _apiServices.getCharacters();

      _requestState = RequestState.success(data);
    } on Failure catch (err) {
      _requestState = RequestState.error(message: err.message);
    } finally {
      notifyListeners();
    }
  }
}
