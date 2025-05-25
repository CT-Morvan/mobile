part of 'max_rep_result_bloc.dart';

@immutable
sealed class MaxRepResultState {}

final class MaxRepResultStateInitial extends MaxRepResultState {}

final class MaxRepResultStateLoading extends MaxRepResultState {}

final class MaxRepResultStateError extends MaxRepResultState {
  final String message;

  MaxRepResultStateError({required this.message});
}

final class MaxRepResultStateSuccess extends MaxRepResultState {
  final List<MaximumRepResultModel> list;
  MaxRepResultStateSuccess({required this.list});
}
