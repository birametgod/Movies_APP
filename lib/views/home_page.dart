import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_app/models/movie_detail.dart';
import 'package:flutter_course_app/services/movie_data.dart';
import 'package:flutter_course_app/widgets/builder_movies.dart';

const urlImage = 'https://image.tmdb.org/t/p/w500';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<MovieDetail>> futureMoviesList;
  Future<List<MovieDetail>> futureTvsList;
  Future<List<MovieDetail>> futureBstMoviesList;
  final _auth = FirebaseAuth.instance;
  User loggedUser;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPopularMovie();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user =  _auth.currentUser;
      if (user != null) {
        print(user.email);
        loggedUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  getPopularMovie()  {
    futureMoviesList = MovieData().getPopularMovie();
    futureTvsList = MovieData().getPopularTv();
    futureBstMoviesList = MovieData().getBestMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black.withOpacity(0.4),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, '/');
              }),
        ],
      ),
      body: Container(
          color: Color(0xFF2C2C2C),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuilderMovies(futureData: futureMoviesList, title: 'Popular Movies', isMovie: true, ),
                  SizedBox(height: 10.0,),
                  BuilderMovies(futureData: futureTvsList, title: 'Tv Movies', isMovie: false,),
                  SizedBox(height: 10.0,),
                  BuilderMovies(futureData: futureBstMoviesList, title: 'Best Movies', isMovie: true,),
                ],
              ),
            ),
          )),
    );
  }
}

