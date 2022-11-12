import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/movie_module/presentation/component/search_result_component.dart';
import 'package:movie_app/movie_module/presentation/controller/search_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {


  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        color: Theme.of(context).scaffoldBackgroundColor ,
        actionsIconTheme: IconThemeData(
          color: Theme.of(context).primaryColor

        ),
        iconTheme :   IconThemeData(
              color: Theme.of(context).primaryColor

        ),

      )
    );
  }

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    print(query);

    return BlocProvider(
      create: (context) => serviceLocator<SearchBloc>()
        ..add(SearchMovieEvent(query)),
      child: const search_result_component(),
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {

    //todo : search for top search in api
    List<String> matchQuery = [];
    // for (var fruit in searchTerms) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     matchQuery.add(fruit);
    //   }
    // }
    return Container();
  }
}
