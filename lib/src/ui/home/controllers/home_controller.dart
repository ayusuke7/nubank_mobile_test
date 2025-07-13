import 'package:flutter/widgets.dart';

import '../../../core/base/base.dart';
import '../../../data/repositories/alias_repository.dart';
import '../states/home_state.dart';

class HomeController extends ValueNotifier<HomeState> {
  final AliasRepository aliasRepository;

  HomeController({
    required this.aliasRepository,
  }) : super(HomeState());

  void createAlias(String url) async {
    value = value.copyWith(status: StateStatus.loading);
    final result = await aliasRepository.createAlias(url);

    if (result.alias.isEmpty) {
      value = value.copyWith(
        error: 'Sorry, Alias not created. Please try again...',
        status: StateStatus.error,
      );
      return;
    }

    value = value.copyWith(
      aliases: [...value.aliases, result],
      status: StateStatus.success,
    );
  }
}
