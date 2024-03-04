import 'package:indonesia_tech_news/features/dialy_news/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository{

Future<DataState<List<ArticleEntity>>> getNewsArticles();


}