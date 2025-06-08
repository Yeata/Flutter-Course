import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/student.dart';
import '../services/db_helper.dart';
import '../utils/validators.dart';

class StudentFormPage extends StatefulWidget {
  final Student? student;

  const StudentFormPage({super.key, this.student});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final _formKey = GlobalKey<FormState>();
  final db = DBHelper();

  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  late TextEditingController classCtrl;
  late TextEditingController deptCtrl;
  String gender = 'Male';

  @override
  void initState() {
    super.initState();
    final s = widget.student;
    nameCtrl = TextEditingController(text: s?.name ?? '');
    emailCtrl = TextEditingController(text: s?.email ?? '');
    phoneCtrl = TextEditingController(text: s?.phone ?? '');
    classCtrl = TextEditingController(text: s?.className ?? '');
    deptCtrl = TextEditingController(text: s?.department ?? '');
    gender = s?.gender ?? 'Male';
  }

  void _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      final isNew = widget.student == null;
      final now = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

      final student = Student(
        id: widget.student?.id,
        name: nameCtrl.text,
        email: emailCtrl.text,
        phone: phoneCtrl.text,
        className: classCtrl.text,
        department: deptCtrl.text,
        gender: gender,
        dateRegistered: widget.student?.dateRegistered ?? now,
        present: widget.student?.present ?? false,
      );

      if (isNew) {
        await db.insertStudent(student);
      } else {
        await db.updateStudent(student);
      }

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.student != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Student' : 'Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: Validators.validateRequired,
              ),
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: Validators.validateEmail,
              ),
              TextFormField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: Validators.validatePhone,
              ),
              TextFormField(
                controller: classCtrl,
                decoration: const InputDecoration(labelText: 'Class'),
                validator: Validators.validateRequired,
              ),
              TextFormField(
                controller: deptCtrl,
                decoration: const InputDecoration(labelText: 'Department'),
                validator: Validators.validateRequired,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: gender,
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (val) => setState(() => gender = val!),
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveStudent,
                child: Text(isEdit ? 'Update' : 'Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
