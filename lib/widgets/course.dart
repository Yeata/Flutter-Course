import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 178,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.all(4.0),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 101,
                  height: 97,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/images/image6.png'),
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Microsoft word',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Ubuntu',
                ),
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.network_wifi_1_bar_outlined,
                    size: 13.0,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'កំរិតដំបូង',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Ubuntu',
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.groups_2, size: 13.0, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  const Text(
                    '99 នាក់បានរៀន',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: 'Ubuntu',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/image7.png'),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Mr. Bunthorn Liv',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      Text(
                        'Professor @ITC',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '\$39.99',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward, size: 14.0),
                    label: const Text(
                      'Start',
                      style: TextStyle(fontSize: 14.0, fontFamily: 'Ubuntu'),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: const Size(10, 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
