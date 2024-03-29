// ignore_for_file: avoid_print
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_auth/src/features/login/presentation/states/login_shared_preferences.dart';
import 'package:flutter_auth/src/features/profile/application/services/profile_service.dart';
import 'package:flutter_auth/src/features/profile/presentation/states/bloc/profile_bloc.dart';
import 'package:flutter_auth/src/routers/route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Color> gradientTextColor = [Colors.purple, Colors.blue];
    ProfileBloc myProfileBloc = ProfileBloc(profileService: ProfileService())
      ..add(LoadProfile());
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(200),
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
                          profileData.placeOfBirth,
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
                      margin: const EdgeInsets.only(
                        right: 16,
                        left: 16,
                        bottom: 128,
                        top: 32,
                      ),
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
                              SnackBar(
                                duration: const Duration(seconds: 3),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: AwesomeSnackbarContent(
                                    title: 'Success!',
                                    message:
                                        "All value in local storage has deleted.",
                                    contentType: ContentType.success),
                              ),
                            );
                            Navigator.pushNamed(context, RouteNames.login);
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
