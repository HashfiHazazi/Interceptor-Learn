// ignore_for_file: unnecessary_new

class ProfileModel {
  final int id;
  final String studentNumber;
  final String firstName;
  final String lastName;
  final String placeOfBirth;
  final String dateOfBirth;
  final String address;
  final String phoneNumber;
  final int studentId;
  final String email;
  final String gender;
  final Student? student;

  ProfileModel(
      {required this.id,
      required this.studentNumber,
      required this.firstName,
      required this.lastName,
      required this.placeOfBirth,
      required this.dateOfBirth,
      required this.address,
      required this.phoneNumber,
      required this.studentId,
      required this.email,
      required this.gender,
      required this.student});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      studentNumber: json['student_number'],
      firstName: json['student_first_name'],
      lastName: json['student_last_name'],
      placeOfBirth: json['place_of_birth'],
      dateOfBirth: json['date_of_birth'],
      address: json['address'],
      phoneNumber: json['phone_number'],
      studentId: json['studentID'],
      email: json['email'],
      gender: json['gender'],
      student: json['Student'] != null
          ? new Student.fromJson(json['Student'])
          : null,
    );
  }
}

class Student {
  final String registNumber;
  final String registDate;
  final String formNumber;
  final String academicYear;
  final String nisn;
  final String nis;
  final int classId;
  final int classRoomId;
  final int studentStatusId;
  final Kelas? kelas;

  Student(
      {required this.registNumber,
      required this.registDate,
      required this.formNumber,
      required this.academicYear,
      required this.nisn,
      required this.nis,
      required this.classId,
      required this.classRoomId,
      required this.studentStatusId,
      required this.kelas});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      registNumber: json['registration_number'],
      registDate: json['registration_date'],
      formNumber: json['form_number'],
      academicYear: json['academic_year'],
      nisn: json['nisn'],
      nis: json['nis'],
      classId: json['classId'],
      classRoomId: json['classRoomId'],
      studentStatusId: json['student_status_id'],
      kelas: json['class'] != null ? new Kelas.fromJson(json['class']) : null,
    );
  }
}

class Kelas {
  final String grade;

  Kelas({required this.grade});

  factory Kelas.fromJson(Map<String, dynamic> json) {
    return Kelas(grade: json['grade']);
  }
}
