import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/image6.png', // <-- make sure the path is right
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Computer Network',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally ',
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'See more...',
                        style: TextStyle(fontSize: 14, color: Colors.orange),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.workspace_premium_outlined,
                            size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          'កំរិតដំបូង',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.people_outline,
                            size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          '99 នាក់បានរៀន',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
