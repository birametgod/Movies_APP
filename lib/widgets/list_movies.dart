import 'package:flutter/material.dart';

class ListMovies extends StatelessWidget {

  ListMovies({@required this.titleHeader, @required this.listMovies});

  final String titleHeader;
  final Widget listMovies;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleHeader,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                  child: listMovies
              ),
            )
          ],
        ),
      ),
    );
  }
}