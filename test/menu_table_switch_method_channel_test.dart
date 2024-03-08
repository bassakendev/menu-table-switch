import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menu_table_switch/menu_table_switch_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMenuTableSwitch platform = MethodChannelMenuTableSwitch();
  const MethodChannel channel = MethodChannel('menu_table_switch');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
