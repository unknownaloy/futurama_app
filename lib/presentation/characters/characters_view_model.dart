import 'package:flutter/cupertino.dart';
import 'package:futurama_app/data/models/character/character.dart';
import 'package:futurama_app/data/unions/request_state.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/utilities/failure.dart';

class CharactersViewModel extends ChangeNotifier {
  final ApiServices _apiServices;

  CharactersViewModel({required ApiServices apiServices})
      : _apiServices = apiServices;

  RequestState _requestState = const RequestState.idle();
  RequestState get requestState => _requestState;

  List<Character> _characters = [];
  List<Character> get characters => [..._characters];

  Future<void> fetchCharacters() async {
    try {
      _requestState = const RequestState.loading();

      _characters = await _apiServices.getCharacters();

      _requestState = const RequestState.success();
    } on Failure catch (err) {
      _requestState = RequestState.error(message: err.message);
    } finally {
      notifyListeners();
    }
  }
}
