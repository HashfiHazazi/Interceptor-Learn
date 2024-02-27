import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/src/profile/application/services/profile_service.dart';
import 'package:flutter_auth/src/profile/domain/models/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService profileService;
  ProfileBloc({required this.profileService}) : super(ProfileInitial()) {
    on<LoadProfile>(
      (event, emit) async {
        emit(ProfileLoading());
        await Future.delayed(const Duration(seconds: 3));
        try {
          final profileResult = await profileService.fetchProfile();
          emit(ProfileLoaded(profileModel: profileResult));
        } catch (e) {
          emit(ProfileError());
        }
      },
    );
  }
}
