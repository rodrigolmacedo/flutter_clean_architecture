import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture/modules/search/presenter/search/states/state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBlock extends Bloc<String, SearchState> {
  final SearchByText usecase;

  SearchBlock(this.usecase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();

    final result = await usecase(searchText);

    yield result.fold((l) => SearchError(error: l), (r) => SearchSuccess(r));
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 800)), transitionFn);
  }
}
