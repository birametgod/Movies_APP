import 'package:flutter/material.dart';
import 'package:flutter_course_app/models/movie_detail.dart';
import 'package:flutter_course_app/utilities/constants.dart';
import 'package:flutter_course_app/widgets/card_movie.dart';
import 'package:flutter_course_app/widgets/list_movies.dart';

class BuilderMovies extends StatelessWidget {
  BuilderMovies({
    @required this.futureData,
     this.title,
     this.element,
    @required this.isMovie
  });

  final Future<List<MovieDetail>> futureData;
  final String title;
  final Widget element;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieDetail>>(
      future: futureData,
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          return ListMovies(
            titleHeader: title,
            listMovies: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context,index) {
                return CardMovie(
                  imagePath: '$urlImage/${snapshot.data[index].image}',
                  id:snapshot.data[index].id,
                  isMovie: isMovie,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            child: Center(
                child: CircularProgressIndicator()
            )
        );
      },
    );
  }
}