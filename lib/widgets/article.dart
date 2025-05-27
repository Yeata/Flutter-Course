import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/image13.png',
              width: 140, 
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '“Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”',
                  style: TextStyle(fontFamily: 'Ubuntu', fontSize: 12),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('Dr. Valy Dona', style: TextStyle(fontSize: 8)),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Professor @ITC,  Cofounder @ Worktency',
                        style: TextStyle(fontSize: 8, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.minor_crash_outlined,
                        color: Color(0xFF164F89),
                      ),
                      label: Text(
                        'Machine Learning',
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Ubuntu',
                          color: Color(0xFF164F89),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF4F5FA),
                        minimumSize: Size(100, 16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.minor_crash_outlined,
                        color: Color(0xFF164F89),
                      ),
                      label: Text(
                        'Machine Learning',
                        style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'Ubuntu',
                          color: Color(0xFF164F89),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF4F5FA),
                        minimumSize: Size(100, 16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 3,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
