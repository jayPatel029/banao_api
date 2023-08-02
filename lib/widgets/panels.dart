import 'package:flutter/material.dart';

class HomePanels extends StatelessWidget {
  const HomePanels({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          Panel(
            title: 'Programs',
            PIcon: Icons.book,
          ),
          Panel(
            title: 'Get Help',
            PIcon: Icons.help_outline_outlined,
          ),
          Panel(
            title: 'Learn',
            PIcon: Icons.menu_book_rounded,
          ),
          Panel(
            title: 'DD Tracker',
            PIcon: Icons.spatial_tracking,
          ),
        ],
      ),
    );
  }
}

class Panel extends StatelessWidget {
  final String title;
  final PIcon;


  const Panel({super.key, required this.title, this.PIcon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5,3,5,3),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8.0),
        height: 80,
        // width: width / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                PIcon,
                color: Colors.blue,
              ),
              // Icon(Icons.book, color: Colors.blue,),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
