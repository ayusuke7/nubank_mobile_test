import 'log.dart';

mixin LogMixin {
  Log get log => Log(runtimeType.toString());
}
