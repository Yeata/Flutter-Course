import 'package:flutter/material.dart';
import '/widgets/article.dart';
import '/widgets/category.dart';
import '/widgets/course.dart';
import '/widgets/navigation_bar.dart';
import '/widgets/promotion_card.dart';
import '/widgets/teacher_card.dart';
import 'online_course_page.dart';
import '/widgets/footer.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnlineCoursePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF164F89)),
        title: Image.asset(
          'assets/images/image.png',
          width: 152.4,
          height: 30,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildHeader(),
            SizedBox(height: 20),
            _buildDescription(),
 SizedBox(height: 20),
Center(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset('assets/images/image2.png'),
      SizedBox(height: 20),
      _buildExploreButton(),
    ],
  ),
),
SizedBox(height: 20),

            SizedBox(height: 80),
            _buildPromotions(),
            SizedBox(height: 80),
            _buildFeaturedCourses(),
            SizedBox(height: 80),
            _buildTeacherSection(),
            SizedBox(height: 50),
            ...List.generate(
              4,
              (_) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Article(),
              ),
            ),

            _buildSeeMore(),
            SizedBox(height: 50),
            Footer(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildHeader() => RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        fontSize: 28,
        color: Colors.black,
        fontFamily: 'InriaSerif',
      ),
      children: [
        TextSpan(text: 'Unlock Your Potential with '),
        TextSpan(
          text: 'Worktency',
          style: TextStyle(
            color: Color(0xFFEE6019),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );

  Widget _buildDescription() => Text(
    'Discover industry-leading courses designed to equip you with real-world skills. Join our community and start your journey to success today.',
    textAlign: TextAlign.center,
    style: TextStyle(fontFamily: 'Ubuntu', fontSize: 15),
  );

  Widget _buildExploreButton() => ElevatedButton.icon(
    onPressed: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OnlineCoursePage()),
    ),
    icon: Icon(Icons.import_contacts_outlined, color: Color(0xFF164F89)),
    label: Text(
      'Explore Courses',
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'Ubuntu',
        color: Color(0xFF164F89),
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFF4F5FA),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );
  Widget _buildPromotions() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      PromotionCard(
        imagePath: 'assets/images/image3.png',
        title: 'Expert Instructors',
      ),
      PromotionCard(
        imagePath: 'assets/images/image4.png',
        title: 'Flexible Learning',
      ),
      PromotionCard(
        imagePath: 'assets/images/image5.png',
        title: 'Hands-On Learning',
      ),
    ],
  );

  Widget _buildFeaturedCourses() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Featured Course',
        style: TextStyle(
          fontSize: 24,
          color: Color(0xff444258),
          fontWeight: FontWeight.w700,
          fontFamily: 'Ubuntu',
        ),
      ),
      SizedBox(height: 20),
      CategoryChips(),
      SizedBox(height: 16),
      SizedBox(
        height: 260 * 2 + 12,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            direction: Axis.vertical,
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              6,
              (index) => SizedBox(width: 178, height: 260, child: CourseCard()),
            ),
          ),
        ),
      ),
    ],
  );

  Widget _buildTeacherSection() => Column(
    children: [
      Align(
        alignment: Alignment.center,
        child: Text(
          'Meet Our Teachers',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xff444258),
            fontWeight: FontWeight.w700,
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
      SizedBox(height: 16),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Teachercard(
              imageAssetPath: 'assets/images/image8.png',
              name: 'Dr. VALY Dona',
              title: 'Researcher, AI Specialist',
            ),
            SizedBox(width: 12),
            Teachercard(
              imageAssetPath: 'assets/images/image9.png',
              name: 'HOK Tin',
              title: 'Web Developer',
            ),
            SizedBox(width: 12),
            Teachercard(
              imageAssetPath: 'assets/images/image11.png',
              name: 'HENG Rathpisey',
              title: 'Lecturer at ITC',
            ),
            SizedBox(width: 12),
            Teachercard(
              imageAssetPath: 'assets/images/image12.png',
              name: 'KHUN Dararith',
              title: 'Cybersecurity Specialist',
            ),
          ],
        ),
      ),
      SizedBox(height: 20),
      Row(
        children: [
          ...List.generate(
            3,
            (_) => Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.orange,
              size: 23,
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: 280,
            child: Text(
              'To reach our only One goal, what we can share with you today ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Ubuntu',
              ),
            ),
          ),
        ],
      ),
    ],
  );

  Widget _buildSeeMore() => Align(
    alignment: Alignment.centerRight,
    child: Text(
      'See more',
      style: TextStyle(
        color: Color(0xFF164F89),
        fontSize: 10,
        decoration: TextDecoration.underline,
      ),
    ),
  );
}
