import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart' as p;

import '../designs/quiet_focus.dart';
import '../designs/pulse.dart';
import '../designs/harbor.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    binding.window.physicalSizeTestValue = const Size(1600, 1000);
    binding.window.devicePixelRatioTestValue = 1.0;
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  tearDownAll(() {
    binding.window.clearPhysicalSizeTestValue();
    binding.window.clearDevicePixelRatioTestValue();
  });

  Future<void> capture(WidgetTester tester, Widget child, String name) async {
    await tester.pumpWidget(
      RepaintBoundary(key: const Key('capture_root'), child: child),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    await tester.runAsync(() async {
      final outputDir = Directory(
        p.join(Directory.current.path, 'designs', 'screenshots'),
      );
      if (!await outputDir.exists()) {
        await outputDir.create(recursive: true);
      }

      final boundary = tester.firstRenderObject<RenderRepaintBoundary>(
        find.byKey(const Key('capture_root')),
      );
      final image = await boundary.toImage(pixelRatio: 1.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        throw TestFailure('Failed to encode screenshot for $name.');
      }

      final path = p.join(outputDir.path, '$name.png');
      await File(path).writeAsBytes(byteData.buffer.asUint8List());
      // ignore: avoid_print
      print('Saved design screenshot: $path');
    });
  }

  testWidgets('capture design screenshots', (tester) async {
    await capture(
      tester,
      const QuietFocusApp(useSystemFonts: true),
      'quiet_focus',
    );
    await capture(tester, const PulseApp(useSystemFonts: true), 'pulse');
    await capture(tester, const HarborApp(useSystemFonts: true), 'harbor');
  });
}
