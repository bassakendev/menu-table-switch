import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'menu_table_switch_method_channel.dart';

abstract class MenuTableSwitchPlatform extends PlatformInterface {
  /// Constructs a MenuTableSwitchPlatform.
  MenuTableSwitchPlatform() : super(token: _token);

  static final Object _token = Object();

  static MenuTableSwitchPlatform _instance = MethodChannelMenuTableSwitch();

  /// The default instance of [MenuTableSwitchPlatform] to use.
  ///
  /// Defaults to [MethodChannelMenuTableSwitch].
  static MenuTableSwitchPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MenuTableSwitchPlatform] when
  /// they register themselves.
  static set instance(MenuTableSwitchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
