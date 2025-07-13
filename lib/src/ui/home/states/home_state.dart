import '../../../core/base/base.dart';
import '../../../domain/dtos/alias_dto.dart';

class HomeState extends BaseState {
  final List<AliasDto> aliases;

  const HomeState({
    super.status,
    super.error,
    this.aliases = const [],
  }) : super();

  HomeState copyWith({
    StateStatus? status,
    String? error,
    List<AliasDto>? aliases,
  }) => HomeState(
    error: error ?? this.error,
    status: status ?? this.status,
    aliases: aliases ?? this.aliases,
  );

  @override
  List<Object?> get props => [status, error, aliases];
}
