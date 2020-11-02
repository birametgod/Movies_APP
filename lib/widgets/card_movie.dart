import 'package:flutter/material.dart';
import 'package:flutter_course_app/views/details_page.dart';

class CardMovie extends StatelessWidget {

  CardMovie({@required this.imagePath, @required this.id, @required this.isMovie });

  final String imagePath;
  final int id;
  final bool isMovie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => DetailPage(id,isMovie)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        width: 130.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: NetworkImage(imagePath),
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}