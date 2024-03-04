import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia_tech_news/core/resources/data_state.dart';
import 'package:indonesia_tech_news/features/dialy_news/domain/usecases/get_article.dart';
import 'package:indonesia_tech_news/features/dialy_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:indonesia_tech_news/features/dialy_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _articleUseCase;

  RemoteArticlesBloc(this._articleUseCase) : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _articleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
