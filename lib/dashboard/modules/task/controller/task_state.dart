part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskStateLoading extends TaskState {}

final class TaskStateLoaded extends TaskState {}

final class TaskStateEmpty extends TaskState {}
