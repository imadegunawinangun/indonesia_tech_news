import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:indonesia_tech_news/features/dialy_news/data/data_sources/remote/news_api_service.dart';
import 'package:indonesia_tech_news/features/dialy_news/data/repository/article_repository_implements.dart';
import 'package:indonesia_tech_news/features/dialy_news/domain/repository/article_repository.dart';
import 'package:indonesia_tech_news/features/dialy_news/domain/usecases/get_article.dart';
import 'package:indonesia_tech_news/features/dialy_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImplements(sl()));

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerFactory(() => RemoteArticlesBloc(sl()));
}
