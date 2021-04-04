import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutter_clean_architecture/modules/search/infra/models/result_search_model.dart';
import 'package:flutter_clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements SearchDatasource {}

main() {
  final datasource = SearchDataSourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test('deve retornar uma lista de resultSearch', () async {
    /* when(datasource.getSearch(any))
        .thenAnswer((realInvocation) async => <ResultSearchModel>[]);

    final result = await repository.search("searchText");

    expect(result.fold(id, id), isA<List<ResultSearchModel>>());*/
  });

  test('deve retornar um DatasourceError se o datasouce falhar', () async {
    /* when(datasource.getSearch(any)).thenThrow(Exception());

    final result = await repository.search("searchText");

    expect(result.fold(id, id), isA<DatasourceError>());*/
  });
}
