import 'package:test/test.dart';
import 'package:App_GoHighlevel/models/favorites.dart';

void main() {
  group('Testing App Provider', () {
    var favorites = Favorites();

    test('A new item should be added', () {
      var number = -1;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test('An item should be removed', () {
      var number = 0;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
