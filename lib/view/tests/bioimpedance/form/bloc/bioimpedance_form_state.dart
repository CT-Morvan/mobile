part of 'bioimpedance_form_bloc.dart';

@immutable
class BioimpedanceFormState {}

final class BioimpedanceFormStateInitial extends BioimpedanceFormState {}

final class BioimpedanceFormStateLoading extends BioimpedanceFormState {}

final class BioimpedanceFormStateError extends BioimpedanceFormState {
  final String message;

  BioimpedanceFormStateError({required this.message});
}

final class BioimpedanceFormStateSuccess extends BioimpedanceFormState {
  BioimpedanceFormStateSuccess();
}
