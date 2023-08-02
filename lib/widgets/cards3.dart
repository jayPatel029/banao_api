import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCards3 extends StatelessWidget {
  final String imgA;
  final String titleA;
  final String subtitleA;
  final String duration;
  // final Icon lockIcon;
  final bool isLocked;

  const HomeCards3(
      {super.key,
        required this.imgA,
        required this.titleA,
        required this.subtitleA,
        required this.duration,
        required this.isLocked,
        // required this.lockIcon,
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
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
              SizedBox(height: 1,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                        "${duration} minutes",
                        style: GoogleFonts.robotoSlab(
                          textStyle:
                          TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ),
                      Icon(
                          isLocked ? CupertinoIcons.lock : CupertinoIcons.lock_open,
                          color: isLocked ? Colors.grey : Colors.green,
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
