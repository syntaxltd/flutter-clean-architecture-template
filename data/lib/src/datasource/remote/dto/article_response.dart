import 'package:json_annotation/json_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleListResponse {
  @JsonKey(name: 'results')
  final List<ArticleResponse> articles;

  ArticleListResponse(this.articles);

  factory ArticleListResponse.fromJson(Map<String, dynamic> json) => _$ArticleListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListResponseToJson(this);
}

@JsonSerializable()
class ArticleResponse {
  final int id;
  final List<MediaResponse> media;
  @JsonKey(name: 'published_date')
  final String publishedDate;
  final String title;
  final String abstract;
  final String updated;
  final String url;

  ArticleResponse(this.id, this.media, this.publishedDate, this.title, this.abstract, this.updated, this.url);

  factory ArticleResponse.fromJson(Map<String, dynamic> json) => _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}

@JsonSerializable()
class MediaResponse {
  @JsonKey(name: 'media-metadata')
  final List<MediaMetaDataResponse>? mediaMetadata;

  MediaResponse(this.mediaMetadata);

  factory MediaResponse.fromJson(Map<String, dynamic> json) => _$MediaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MediaResponseToJson(this);
}

@JsonSerializable()
class MediaMetaDataResponse {
  final String url;

  MediaMetaDataResponse(this.url);

  factory MediaMetaDataResponse.fromJson(Map<String, dynamic> json) => _$MediaMetaDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMetaDataResponseToJson(this);
}
