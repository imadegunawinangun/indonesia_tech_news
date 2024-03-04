import 'package:indonesia_tech_news/core/resources/data_state.dart';
import 'package:indonesia_tech_news/features/dialy_news/data/models/article.dart';

import 'package:indonesia_tech_news/features/dialy_news/domain/entities/article.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImplements implements ArticleRepository{
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
  
}