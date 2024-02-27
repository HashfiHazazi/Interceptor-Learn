part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileInitial {}

final class ProfileLoaded extends ProfileInitial {
  final ProfileModel profileModel;

  ProfileLoaded({required this.profileModel});
}

final class ProfileError extends ProfileInitial {}
