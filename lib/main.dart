import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class Student {
  String name;
  String? email;
  String? phone;

  Student(this.name, this.email, this.phone);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentList(),
    );
  }
}

class StudentList extends StatelessWidget {
  const StudentList({super.key});


  static final List<Student> danhSach = [
    Student('Nguyễn Văn An', 'an@sv.edu.vn', '0901 234 567'),
    Student('Trần Thị Bình', null, '0912 888 999'),
    Student('Lê Minh Chi', 'chi@sv.edu.vn', null),
    Student('Phạm Quốc Dũng', null, null),
    Student('Võ Thanh Em', 'em@sv.edu.vn', '0933 111 222'),
  ];


  Widget dongThongTin(String nhan, String? giaTri) {

    String hienThi = giaTri ?? 'Chưa cập nhật';
    return Text(
      '$nhan: $hienThi',
      style: TextStyle(
        fontSize: 13,
        color: giaTri == null ? Colors.red : Colors.black54,
        fontStyle: giaTri == null ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> cacThe = [];
    for (Student sv in danhSach) {
      cacThe.add(
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(sv.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              dongThongTin('Email', sv.email),
              dongThongTin('SĐT', sv.phone),
            ],
          ),
        ),
      );
    }


    int thieuEmail = 0;
    for (Student sv in danhSach) {
      if (sv.email == null) {
        thieuEmail++;
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Danh sách sinh viên',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2C4A7C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ...cacThe,
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.blue[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng: ${danhSach.length} sinh viên'),
                  Text('Thiếu email: $thieuEmail'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}