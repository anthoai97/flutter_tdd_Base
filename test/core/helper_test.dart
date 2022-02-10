import 'package:awesome_app/core/helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("stringToInt", () {
    final String testCase1 = '1';
    final String testCase2 = '12123124124';
    final String testCase3 = '1asd';
    final String testCase4 = 'aaaa';
    test('testCase1', () {
      expect(Helper.stringToInt(testCase1), isA<int>());
    });

    test('testCase2', () {
      expect(Helper.stringToInt(testCase2), isA<int>());
    });

    test('testCase3', () {
      expect(Helper.stringToInt(testCase3), null);
    });

    test('testCase4', () {
      expect(Helper.stringToInt(testCase4), null);
    });
  });
}
