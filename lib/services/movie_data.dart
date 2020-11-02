import 'package:flutter_course_app/models/movie_detail.dart';
import 'package:flutter_course_app/services/networking.dart';

const apiKey = 'a4f0eddd571a9c8c0c431e9dfe051c15';
const url = 'https://api.themoviedb.org/3';

class MovieData {

  Future<List<MovieDetail>> getPopularMovie() async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        url: '$url/movie/popular?api_key=$apiKey'
    );
    var decodedData = await networkingHelper.getData();
    List<MovieDetail> moviesList = List<MovieDetail>.from(decodedData['results'].map((j) => MovieDetail.fromJson(j)));
    return moviesList;
  }

  Future<List<MovieDetail>> getPopularTv() async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        url: '$url/tv/popular?api_key=$apiKey'
    );
    var decodedData = await networkingHelper.getData();
    List<MovieDetail> moviesList = List<MovieDetail>.from(decodedData['results'].map((j) => MovieDetail.fromJson(j)));
    return moviesList;
  }

  Future<List<MovieDetail>> getBestMovies() async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        url: '$url/movie/top_rated?api_key=$apiKey'
    );
    var decodedData = await networkingHelper.getData();
    List<MovieDetail> moviesList = List<MovieDetail>.from(decodedData['results'].map((j) => MovieDetail.fromJson(j)));
    return moviesList;
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        url: '$url/movie/$id?api_key=$apiKey'
    );
    var decodedData = await networkingHelper.getData();
    MovieDetail movie = MovieDetail.fromJson(decodedData);
    return movie;
  }

  Future<MovieDetail> getTvDetail(int id) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        url: '$url/tv/$id?api_key=$apiKey'
    );
    var decodedData = await networkingHelper.getData();
    MovieDetail movie = MovieDetail.fromJson(decodedData);
    return movie;
  }


}