import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/modules/search/external/datasources/github_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDataSource(dio);

  test('deve retornar uma lista de ResultSearchModel', () async {
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(
        data: jsonDecode(githubResponse),
        statusCode: 200,
        requestOptions: null));

    final future = datasource.getSearch("searchText");

    expect(future, completes);
  });

  test('deve retornar uma datasourceError se o statuscode não for 200',
      () async {
    when(dio.get(any)).thenAnswer((realInvocation) async =>
        Response(data: null, statusCode: 401, requestOptions: null));

    final future = datasource.getSearch("searchText");

    expect(future, throwsA(isA<DatasourceError>()));
  });

  test('deve retornar uma exception se tiver um erro no dio', () async {
    when(dio.get(any)).thenThrow(Exception());

    final future = datasource.getSearch("searchText");

    expect(future, throwsA(isA<Exception>()));
  });
}
