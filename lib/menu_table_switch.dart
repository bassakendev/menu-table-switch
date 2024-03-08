
import 'menu_table_switch_platform_interface.dart';

class MenuTableSwitch {
  Future<String?> getPlatformVersion() {
    return MenuTableSwitchPlatform.instance.getPlatformVersion();
  }
}
