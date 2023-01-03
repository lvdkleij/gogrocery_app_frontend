import 'package:app/widgets/top_navigation_bar/top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ImageButtonSl sets default values', () {
    final imageButtonSl =
        ImageButtonSl(icon: const Icon(Icons.abc), onTap: () {});

    expect(imageButtonSl.backgroundColor, Colors.transparent);
    expect(imageButtonSl.hideFocus, true);
  });

  test('ImageButtonSl sets custom values', () {
    final imageButtonSl = ImageButtonSl(
      icon: const Icon(Icons.abc),
      onTap: () {},
      hideFocus: true,
      backgroundColor: Colors.red,
    );

    expect(imageButtonSl.backgroundColor, Colors.red);
    expect(imageButtonSl.hideFocus, true);
    expect(imageButtonSl.icon.icon, Icons.abc);
    expect(imageButtonSl.onTap.runtimeType, VoidCallback);
  });

  testWidgets('ImageButtonSl test', (tester) async {
    var shouldBecomeTrueOnTap = false;
    final imageButtonSl = ImageButtonSl(
        backgroundColor: Colors.red,
        icon: const Icon(Icons.abc),
        onTap: () {
          shouldBecomeTrueOnTap = true;
        });

    await tester.pumpWidget(MaterialApp(home: imageButtonSl));

    await tester.tap(find.byWidget(imageButtonSl));
    expect(shouldBecomeTrueOnTap, true);

    final iconFinder = find.byIcon(Icons.abc);
    final colorFinder =
        (tester.widget<Ink>(find.byType(Ink)).decoration as BoxDecoration)
            .color;

    expect(colorFinder, Colors.red);
    expect(iconFinder, findsOneWidget);
  });
}
