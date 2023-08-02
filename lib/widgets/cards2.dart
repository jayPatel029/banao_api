import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCards2 extends StatelessWidget {
  final String imgA;
  final String titleA;
  final String subtitleA;
  final String lessonsA;

  const HomeCards2(
      {super.key,
        required this.imgA,
        required this.titleA,
        required this.subtitleA,
        required this.lessonsA,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        height: 280,
        width: 242,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imgA,
              height: 140,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titleA,
                style: GoogleFonts.robotoSlab(
                  textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitleA,
                style: GoogleFonts.robotoSlab(
                  textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    lessonsA,
                    style: GoogleFonts.robotoSlab(
                      textStyle:
                      TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: OutlinedButton(
                      onPressed: () {},
                      child: Text('Book', style: GoogleFonts.robotoSlab(),),
                      style: OutlinedButton.styleFrom(shape: StadiumBorder() )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
