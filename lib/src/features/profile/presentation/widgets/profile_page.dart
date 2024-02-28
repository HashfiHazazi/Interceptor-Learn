// ignore_for_file: avoid_print
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
    const List<Color> gradientTextColor = [Colors.purple, Colors.blue];
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "First Name: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.firstName,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Last Name: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.lastName,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Place Of birth: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.lastName,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date Of birth: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.dateOfBirth,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.address,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Phone Number: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.phoneNumber,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Student Id: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          '${profileData.studentId}',
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Email: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.email,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Gender: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.gender,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Registration Number: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.student!.registNumber,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Registration Date: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.student!.registDate,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Form Number: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.student!.formNumber,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Academic Year: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.student!.academicYear,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "NISN: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.student!.nisn,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "NIS: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.student!.nis,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Class Id: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          '${profileData.student!.classId}',
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Class Room Id: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          '${profileData.student!.classRoomId}',
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Student Status Id: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          '${profileData.student!.studentStatusId}',
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Class: ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        GradientText(
                          profileData.student!.kelas!.grade,
                          colors: gradientTextColor,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
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
