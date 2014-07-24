library geometry;

import 'dart:math';

part 'point.dart';
part 'box.dart';
part 'size.dart';

int _calculateHash(List<num> values) {
  return values.fold(7, (prev, value) => 32 * prev + value.hashCode);
}