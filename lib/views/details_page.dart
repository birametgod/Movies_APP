import 'package:flutter/material.dart';
import 'package:flutter_course_app/models/movie_detail.dart';
import 'package:flutter_course_app/services/movie_data.dart';
import 'package:flutter_course_app/utilities/constants.dart';

class DetailPage extends StatefulWidget {
  DetailPage(this.id,this.isMovie);

  final int id;
  final bool isMovie;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<MovieDetail> movieDetail;
  Future<MovieDetail> tvDetail;
  List<Widget> genres;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetail =  widget.isMovie == true ?  MovieData().getMovieDetail(widget.id) : MovieData().getTvDetail(widget.id);
  }

  List<Widget> getGenreList(List genresMovie ) {
    genres = [];
    for(var genre in genresMovie){
      Widget myGenreWidget = Container(
          padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.all(
                Radius.circular(5.0)),
          ),
          child: Text(
            '${genre['name']}',
            style: TextStyle(
                color: Colors.black,
                fontWeight:
                FontWeight.bold),
          ));
      genres.add(myGenreWidget);
    }
    return genres;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieDetail>(
      future: movieDetail ,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            color:  Color(0xFF2C2C2C),
            child: SafeArea(
              top: false,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    '$urlImage/${snapshot.data.image}',
                    fit: BoxFit.cover,
                  ),
                  Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        elevation: 1.0,
                        backgroundColor: Colors.black.withOpacity(0.4),
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 20.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          children: [
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.41,
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Colors.black.withAlpha(0),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C),
                                      Color(0xFF2C2C2C)
                                    ])),
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data.title}',
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '15+',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                '-',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                '${snapshot.data.yearRelease.split('-')[0]}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                '-',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Icon(
                                                Icons.grade,
                                                size: 15.0,
                                                color: Colors.orange[300],
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                '${snapshot.data.vote}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.orange[300]),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Wrap(
                                            spacing: 10.0,
                                            runSpacing: 4.0,
                                            children: getGenreList(snapshot.data.genre),
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                          ),
                                          Text.rich(TextSpan(
                                              text: 'Cast:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                    text:
                                                    ' Millie Bobby Brown Henry Cavili Sam \n Clafin Helena Bonham Carter',
                                                    style: TextStyle(
                                                        fontStyle:
                                                        FontStyle.italic,
                                                        fontWeight:
                                                        FontWeight.normal)),
                                              ])),
                                          SizedBox(
                                            height: 35.0,
                                          ),
                                          Text(
                                            'Summary',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            '${snapshot.data.overview}',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
