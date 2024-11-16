import 'package:movies_app_task/core/network/api_keys.dart';


class PaginationModel {
  final int page;
  final int totalPages;
  final int totalResults;

  const PaginationModel({
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      page: json[ApiKeys.pageKey] ?? 1,
      totalPages: json[ApiKeys.totalPagesKey] ?? 1,
      totalResults: json[ApiKeys.totalResultsKey] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.pageKey: page,
      ApiKeys.totalPagesKey: totalPages,
      ApiKeys.totalResultsKey: totalResults,
    };
  }

  bool get isLastPage => page >= totalPages;

  PaginationModel copyWith({
    int? page,
    int? totalPages,
    int? totalResults,
  }) {
    return PaginationModel(
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
