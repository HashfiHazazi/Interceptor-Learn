import 'package:flutter/material.dart';
import 'package:flutter_auth/src/features/login/presentation/states/login_shared_preferences.dart';
import 'package:flutter_auth/src/features/profile/application/services/profile_service.dart';
import 'package:flutter_auth/src/features/profile/presentation/states/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileBloc myProfileBloc = ProfileBloc(profileService: ProfileService())
      ..add(LoadProfile());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GradientText(
          'Profile Page',
          colors: const [Colors.purple, Colors.lightBlue],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: const Icon(null),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: myProfileBloc,
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Loading...',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
            );
          } else if (state is ProfileLoaded) {
            final profileData = state.profileModel;
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name: ${profileData.firstName}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Last Name: ${profileData.lastName}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Place Of birth: ${profileData.placeOfBirth}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Date Of birth: ${profileData.dateOfBirth}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Address: ${profileData.address}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Phone Number: ${profileData.phoneNumber}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Student ID: ${profileData.studentId}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Email: ${profileData.email}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Gender: ${profileData.gender}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Registration Number: ${profileData.student!.registNumber}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Registration Date: ${profileData.student!.registDate}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Form Number: ${profileData.student!.formNumber}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Academic Year: ${profileData.student!.academicYear}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "NISN: ${profileData.student!.nisn}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "NIS: ${profileData.student!.nis}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "ID Kelas: ${profileData.student!.classId}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "ID Ruang Kelas: ${profileData.student!.classRoomId}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "ID Student Status: ${profileData.student!.studentStatusId}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Kelas: ${profileData.student!.kelas!.grade}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () async {
                          print("ON PRESSED LOGOUT");
                          await LoginSharedPreferences.clear();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.green,
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Access Token, User_id, Code has deleted',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            );
                            Navigator.pushNamed(context, '/login');
                          }
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    )
                    // Text("Gender: ${profileData.student.classId}"),
                  ],
                ),
              ),
            );
          } else if (state is ProfileError) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Profile Error...',
                    style: TextStyle(color: Colors.red, fontSize: 24),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Not Found...',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
