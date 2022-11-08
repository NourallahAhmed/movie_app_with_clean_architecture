import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/movie_module/presentation/controller/search_bloc.dart';

import '../../../core/utils/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../component/search_bar_component.dart';
import '../component/search_result_component.dart';
import 'movie_detail_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController _searchKeyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
        create: (context) =>
            serviceLocator<SearchBloc>()..add(SearchMovieEvent("the")),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  // method to show the search bar
                  showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate()
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body:

          // TextField(
          //               controller: _searchKeyword,
          //               onEditingComplete: () {
          //                 print(_searchKeyword.text);
          //               },
          //               decoration: InputDecoration(
          //                 border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(30),
          //                   borderSide: BorderSide.none,
          //                 ),
          //                 filled: true,
          //                 fillColor: Colors.white,
          //                 hintText: "The good father",
          //                 prefixIcon: Icon(Icons.search),
          //               ),
          //             ),


                search_result_component(),
              ),
        );
  }
}

