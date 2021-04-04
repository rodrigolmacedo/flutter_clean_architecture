import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/modules/search/external/datasources/github_datasource.dart';
import 'package:flutter_clean_architecture/modules/search/presenter/search/search_bloc.dart';
import 'package:flutter_clean_architecture/modules/search/presenter/search/search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';

class AppModule extends Module {
  @override
  @override
  final List<Bind> binds = [
    Bind.factory((i) => Dio()),
    Bind.lazySingleton((i) => GithubDataSource(i())),
    Bind.lazySingleton((i) => SearchRepositoryImpl(i())),
    Bind.lazySingleton((i) => SearchByTextImpl(i())),
    Bind.lazySingleton((i) => SearchBlock(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SearchPage())
  ];
}
