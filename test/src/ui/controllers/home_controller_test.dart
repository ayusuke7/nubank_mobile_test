import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nubank_mobile_test/src/core/base/base.dart';
import 'package:nubank_mobile_test/src/data/repositories/alias_repository.dart';
import 'package:nubank_mobile_test/src/domain/dtos/alias_dto.dart';
import 'package:nubank_mobile_test/src/ui/home/controllers/home_controller.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([AliasRepository])
void main() {
  late HomeController controller;
  late MockAliasRepository mockAliasRepository;

  setUp(() {
    mockAliasRepository = MockAliasRepository();
    controller = HomeController(aliasRepository: mockAliasRepository);
  });

  group('HomeController', () {
    test('should set loading status when createAlias is called', () async {
      when(
        mockAliasRepository.createAlias(any),
      ).thenAnswer((_) async => null);
      controller.createAlias('https://test.com');
      expect(controller.value.status, StateStatus.loading);
    });

    test(
      'should set error status and message if alias creation fails',
      () async {
        when(
          mockAliasRepository.createAlias(any),
        ).thenAnswer((_) async => null);

        final future = controller.createAlias('https://test.com');
        expect(controller.value.status, StateStatus.loading);

        await future;
        expect(controller.value.status, StateStatus.error);
        expect(controller.value.error, isNotNull);
      },
    );

    test(
      'should add alias and set success status if alias creation succeeds',
      () async {
        final fakeAlias = AliasDto(
          alias: '123',
          url: 'https://test.com',
        );

        when(
          mockAliasRepository.createAlias(any),
        ).thenAnswer((_) async => fakeAlias);

        final future = controller.createAlias('https://test.com');
        expect(controller.value.status, StateStatus.loading);

        await future;

        expect(controller.value.status, StateStatus.success);
        expect(controller.value.aliases, contains(fakeAlias));
        expect(controller.value.error, isNull);
      },
    );
  });
}
