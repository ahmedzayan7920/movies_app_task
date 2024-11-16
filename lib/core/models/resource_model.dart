import 'pagination_model.dart';

class ResourceModel<T> {
  final T data;
  final PaginationModel? pagination;

  const ResourceModel({
    required this.data,
    this.pagination,
  });

  bool get isPaginated => pagination != null;

 bool get hasNextPage {
  if (!isPaginated || pagination == null) return false;
  return pagination!.page < pagination!.totalPages;
}

  int? get nextPage {
    if (!hasNextPage) return null;
    return (pagination?.page ?? 0) + 1;
  }

  ResourceModel<T> copyWith({
    T? data,
    PaginationModel? pagination,
  }) {
    return ResourceModel<T>(
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }
}
