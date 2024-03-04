import 'dart:io';
import 'package:dio/dio.dart';
import 'package:indonesia_tech_news/core/constants/constants.dart';

import '../../../../core/resources/data_state.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/article.dart';
import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImplements implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImplements(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        category: categoryQuery,
        country: countryQuery,
      );

      return httpResponse.response.statusCode == HttpStatus.ok
          ? DataSuccess(httpResponse.data)
          : DataFailed(
              DioException(
                requestOptions: httpResponse.response.requestOptions,
                error: httpResponse.response.statusMessage,
                type: DioExceptionType.badResponse,
                response: httpResponse.response,
              ),
            );
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
