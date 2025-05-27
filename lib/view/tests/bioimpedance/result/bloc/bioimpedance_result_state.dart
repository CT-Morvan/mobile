part of 'bioimpedance_result_bloc.dart';

@immutable
class BioimpedanceResultState {}

final class BioimpedanceResultStateInitial extends BioimpedanceResultState {}

final class BioimpedanceResultStateLoading extends BioimpedanceResultState {}

final class BioimpedanceResultStateError extends BioimpedanceResultState {
  final String message;

  BioimpedanceResultStateError({required this.message});
}

final class BioimpedanceResultStateSuccess extends BioimpedanceResultState {
  final List<BioimpedanceModel> list;
  BioimpedanceResultStateSuccess({required this.list});
}
