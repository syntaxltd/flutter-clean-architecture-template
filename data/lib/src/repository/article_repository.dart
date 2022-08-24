import 'package:data/src/datasource/local/dao/article_dao.dart';
import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/remote/dto/article_response.dart';
import 'package:data/src/datasource/remote/service/article_service.dart';
import 'package:data/src/mapper/article_mapper.dart';
import 'package:data/src/repository/base/base_repository.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticleRepository)
class ArticleRepositoryImpl extends BaseRepository implements ArticleRepository {
  final ArticleService _articleService;
  final ArticleDao _articleDao;

  ArticleRepositoryImpl(this._articleService, this._articleDao);

  @override
  Future<Result<ArticleModel>> getArticle(int id) async {
    // return safeCall(_articleService.getArticles(),
    //     mapper: (ArticleResponse response) => response.articles
    //         .map((e) => e.toModel())
    //         .toList()
    //         .firstWhere((element) => element.id == id));
    return safeDbCall(_articleDao.getArticleById(id), mapper: (Article? entity) => entity?.toModel());
  }

  @override
  Future<Result<List<ArticleModel>>> getArticles() {
    return safeApiCall(_articleService.getArticles(),
        mapper: (ArticleListResponse response) => response.articles.map((e) => e.toModel()).toList(),
        saveResult: (ArticleListResponse response) => _articleDao.saveArticles(response.articles.map((e) => e.toEntity()).toList()));
  }
}
