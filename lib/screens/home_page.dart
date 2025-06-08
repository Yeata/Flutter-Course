import 'package:flutter/material.dart';
import '../services/db_helper.dart';
import '../models/student.dart';
import 'student_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = DBHelper();
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final data = await db.getStudents();
    setState(() => students = data);
  }

  void _goToForm({Student? student}) async {
    final shouldRefresh = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentFormPage(student: student),
      ),
    );
    if (shouldRefresh == true) {
      _loadStudents();
    }
  }

  void _deleteStudent(int id) async {
    await db.deleteStudent(id);
    _loadStudents();
  }

  void _toggleAttendance(Student student) async {
    student.present = !student.present;
    await db.updateStudent(student);
    _loadStudents();
  }

  Widget _buildStudentCard(Student s) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: s.present ? Colors.green : Colors.red,
          child: Icon(s.present ? Icons.check : Icons.close, color: Colors.white),
        ),
        title: Text(s.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Phone: ${s.phone}\nClass: ${s.className} | Dept: ${s.department}"),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _goToForm(student: s),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteStudent(s.id!),
            ),
            IconButton(
              icon: Icon(s.present ? Icons.toggle_on : Icons.toggle_off, color: Colors.teal),
              onPressed: () => _toggleAttendance(s),
            ),
          ],
        ),
        onTap: () => _goToForm(student: s),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Class Manager")),
      body: students.isEmpty
          ? const Center(child: Text("No students yet. Tap + to add."))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return _buildStudentCard(students[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
