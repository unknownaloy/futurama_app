import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_app/data/models/info/creator/creator.dart';
import 'package:futurama_app/data/models/info/info_model.dart';
import 'package:futurama_app/data/unions/request_state.dart';
import 'package:futurama_app/presentation/home/home_view_model.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  late HomeViewModel sut;
  late MockApiServices mockApiServices;

  setUp(() {
    mockApiServices = MockApiServices();

    sut = HomeViewModel(apiServices: mockApiServices);
  });

  final infoData = InfoModel(
    id: 1,
    synopsis: "The quick brown fox jumps over the lazy dog",
    yearsAired: "2020 - 2023",
    creators: [
      Creator(name: "Ellis Ifoegbu", url: "https://i.pravatar.cc/209"),
    ],
  );

  void initialHomeViewModelWithData() {
    when(mockApiServices.getInfo()).thenAnswer(
      (_) async => infoData,
    );
  }

  test("Test that initial values are correct", () {
    expect(sut.requestState, const RequestState.idle());
  });

  group("fetchInfoData", () {
    test("fetchInfoData uses the mockApiService", () async {
      initialHomeViewModelWithData();

      await sut.fetchInfoData();
      verify(mockApiServices.getInfo()).called(1);
    });

    test("""indicates loading of data, 
    set infoData to the one gotten from the service,
    indicates that the data is not being loaded anymore""", () async {
      initialHomeViewModelWithData();
      final future = sut.fetchInfoData();
      expect(sut.requestState, const RequestState<InfoModel>.loading());
      await future;

      expect(sut.requestState, RequestState.success(infoData));
    });
  });
}
