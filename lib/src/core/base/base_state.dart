import 'package:equatable/equatable.dart';

enum StateStatus {
  initial,
  loading,
  success,
  error;

  bool get isLoading => this == StateStatus.loading;
  bool get isSuccess => this == StateStatus.success;
  bool get isError => this == StateStatus.error;
}

abstract class BaseState extends Equatable {
  final StateStatus status;
  final String? error;

  const BaseState({
    this.status = StateStatus.initial,
    this.error,
  });
}
