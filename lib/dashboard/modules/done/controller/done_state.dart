part of 'done_cubit.dart';

@immutable
sealed class DoneState {}

final class DoneStateLoading extends DoneState {}

final class DoneStateLoaded extends DoneState {}

final class DoneStateEmpty extends DoneState {}
