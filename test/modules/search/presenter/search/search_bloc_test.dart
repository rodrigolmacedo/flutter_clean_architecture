import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture/modules/search/presenter/search/search_bloc.dart';
import 'package:flutter_clean_architecture/modules/search/presenter/search/states/state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class UseCaseMock extends Mock implements SearchByText {}

main() {
  final usecase = UseCaseMock();
  final bloc = SearchBlock(usecase);

  test('deve retornar os estados na ordem correta', () {
    when(usecase.call(any)).thenAnswer((_) async => Right(<ResultSearch>[]));

    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSuccess>(),
        ]));

    bloc.add("rodrigo");
  });

  test('deve retornar error', () {
    when(usecase.call(any)).thenAnswer((_) async => Left(InvalidTextError()));

    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchError>(),
        ]));

    bloc.add("rodrigo");
  });
}
