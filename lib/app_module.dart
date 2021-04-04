import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/modules/search/external/datasources/github_datasource.dart';
import 'package:flutter_clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutter_clean_architecture/modules/search/presenter/search/search_bloc.dart';
import 'package:flutter_clean_architecture/modules/search/presenter/search/search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart' hide Router;

import 'package:flutter_clean_architecture/app_widget.dart';
import 'package:flutter_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubDataSource(i.get<Dio>())),
        Bind((i) => SearchRepositoryImpl(i.get<SearchDatasource>())),
        Bind((i) => SearchByTextImpl(i.get<SearchRepository>())),
        Bind((i) => SearchBlock(i.get<SearchByText>())),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', child: (_, __) => SearchPage())];

  static Inject get to => Inject<AppModule>.of();
}
