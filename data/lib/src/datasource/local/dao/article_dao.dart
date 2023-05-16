import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/local/entity/article_entity.dart';
import 'package:drift/drift.dart';

part 'article_dao.g.dart';

@DriftAccessor(tables: <Type>[Articles])
class ArticleDao extends DatabaseAccessor<AppDatabase> with _$ArticleDaoMixin {
  final AppDatabase appDb;

  ArticleDao(this.appDb) : super(appDb);
  Future<List<Article>> getArticles() => (select(articles)).get();

  Future<void> saveArticles(List<Article> values) => batch((batch) => batch.insertAllOnConflictUpdate(
      articles,
      values.map((e) => ArticlesCompanion.insert(
          id: Value<int>(e.id), title: e.title, description: e.description, imageUrl: e.imageUrl, articleUrl: e.articleUrl, date: Value<DateTime>(e.date)))));

  Future<Article?> getArticleById(int id) => (select(articles)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
}
