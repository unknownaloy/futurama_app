import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:futurama_app/data/models/info/info_model.dart';

part 'home_request_state.freezed.dart';

@freezed
class HomeRequestState with _$HomeRequestState {
  const factory HomeRequestState.idle() = _Idle;
  const factory HomeRequestState.loading() = _Loading;
  const factory HomeRequestState.success( InfoModel? data) = _Success;
  const factory HomeRequestState.error({required String message}) = _Error;
}