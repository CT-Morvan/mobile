part of 'bioimpedance_form_bloc.dart';

@immutable
class BioimpedanceEvent {
  const BioimpedanceEvent();
}

final class BioimpedanceFormEvent extends BioimpedanceEvent {
  final int? userId;
  final BioimpedanceModel bioimpedance;

  const BioimpedanceFormEvent({
    required this.userId,
    required this.bioimpedance,
  });
}
