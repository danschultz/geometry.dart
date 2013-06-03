library geometry_tests;

import 'package:unittest/unittest.dart';
import 'package:geometry/geometry.dart';

part 'point_tests.dart';
part 'size_tests.dart';
part 'box_tests.dart';

void main() {
  testPoint();
  testSize();
  testBox();
}