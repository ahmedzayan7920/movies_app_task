import 'package:flutter/material.dart';

import '../../../../../core/app/app_routes.dart';
import '../../../models/movie_model.dart';
import 'movies_list_view_item.dart';

class MoviesListView extends StatefulWidget {
  const MoviesListView({
    super.key,
    required this.movies,
    this.isLoadingMore = false,
    this.onLoadMore,
  });
  final List<MovieModel> movies;
  final bool isLoadingMore;
  final VoidCallback? onLoadMore;

  @override
  State<MoviesListView> createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      widget.onLoadMore?.call();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.movies.length + (widget.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == widget.movies.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              MovieModel movie = widget.movies[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.movieDetails,
                      arguments: movie.id);
                },
                child: MoviesListViewItem(
                  movie: movie,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
