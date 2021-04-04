import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/app_module.dart';
import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_modular/src/inject/bind.dart' as b;

class DioMock extends Mock implements Dio {}

main() async {
  final dio = DioMock();
  initModule(AppModule(),
      changeBinds: [b.Bind((i) => dio)], initialModule: true);

  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });

  test('Deve recuperar uma lista de ResultSearch', () async {
    final usecase = Modular.get<SearchByText>();
    final result = await usecase("Rodrigo");
    expect(result.fold(id, id), isA<List<ResultSearch>>());
  });
}
