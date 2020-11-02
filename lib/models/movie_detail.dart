class MovieDetail {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final bool adult;
  final String image;
  final List genre;
  final dynamic vote;
  final String yearRelease;

  MovieDetail(
      this.id,
      this.title,
      this.releaseDate,
      this.adult,
      this.overview,
      this.image,
      this.genre,
      this.vote,
      this.yearRelease
      );

  MovieDetail.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'] != null ?  json['title'] :  json['name'],
      releaseDate = json['release_date'],
      overview = json['overview'],
      adult = json['adult'],
      genre = json['genres'],
      image = json['poster_path'],
      yearRelease = json['release_date'] != null ? json['release_date'] : json['first_air_date'],
      vote = json['vote_average'];


}