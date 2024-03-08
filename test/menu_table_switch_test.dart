import 'package:flutter_test/flutter_test.dart';
import 'package:menu_table_switch/menu_table_switch.dart';
import 'package:menu_table_switch/menu_table_switch_method_channel.dart';
import 'package:menu_table_switch/menu_table_switch_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMenuTableSwitchPlatform
    with MockPlatformInterfaceMixin
    implements MenuTableSwitchPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MenuTableSwitchPlatform initialPlatform = MenuTableSwitchPlatform.instance;

  test('$MethodChannelMenuTableSwitch is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMenuTableSwitch>());
  });

  test('getPlatformVersion', () async {
    MenuTableSwitch menuTableSwitchPlugin =
        const MenuTableSwitch(menuItems: []);
    MockMenuTableSwitchPlatform fakePlatform = MockMenuTableSwitchPlatform();
    MenuTableSwitchPlatform.instance = fakePlatform;

    expect(await menuTableSwitchPlugin.getPlatformVersion(), '42');
  });
}
