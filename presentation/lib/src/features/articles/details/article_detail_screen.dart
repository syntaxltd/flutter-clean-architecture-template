import 'package:auto_route/annotations.dart';
import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common/constants/app_strings.dart';
import 'package:presentation/src/common/constants/assets.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/articles/details/article_detail_view_model.dart';

@RoutePage()
class ArticleDetailScreen extends CoreScreen<ArticleDetailViewModel> {
  final int id;

  const ArticleDetailScreen({required this.id});

  @override
  Widget builder(BuildContext context, ArticleDetailViewModel viewModel, Widget? child) {
    return Scaffold(appBar: AppBar(title: Text(AppStrings.articleDetail)), body: _buildBody(context, viewModel));
  }

  Widget _buildBody(BuildContext context, ArticleDetailViewModel viewModel) {
    if (viewModel.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (viewModel.hasError) {
      return Center(child: Text(viewModel.errorMsg));
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FadeInImage(
              height: 300,
              fit: BoxFit.cover,
              placeholder: AssetImage(Assets.placeholder),
              image: NetworkImage(viewModel.articleModel.imageUrl),
              imageErrorBuilder: (_, __, ___) => Image.asset(Assets.placeholder),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(viewModel.articleModel.title, style: TextStyle(fontSize: 22, color: Theme.of(context).primaryColor)),
            ),
            Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 20), child: Text(viewModel.articleModel.description, style: TextStyle(fontSize: 20))),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Align(child: Text("${AppStrings.publishedOn} ${viewModel.articleModel.date}"), alignment: Alignment.centerRight),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextButton(
                onPressed: () => {},
                child: Text(AppStrings.readFullStory, style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor), textAlign: TextAlign.end),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  ArticleDetailViewModel viewModelBuilder(BuildContext context) => locator<ArticleDetailViewModel>()..getArticleDetails(id);
}
