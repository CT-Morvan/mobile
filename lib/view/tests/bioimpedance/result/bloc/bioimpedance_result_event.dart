part of 'bioimpedance_result_bloc.dart';

@immutable
final class BioimpedanceResultEvent {
  final int? userId;

  const BioimpedanceResultEvent({
    required this.userId,
  });
}