#ifndef FLUTTER_PLUGIN_MENU_TABLE_SWITCH_PLUGIN_H_
#define FLUTTER_PLUGIN_MENU_TABLE_SWITCH_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace menu_table_switch {

class MenuTableSwitchPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MenuTableSwitchPlugin();

  virtual ~MenuTableSwitchPlugin();

  // Disallow copy and assign.
  MenuTableSwitchPlugin(const MenuTableSwitchPlugin&) = delete;
  MenuTableSwitchPlugin& operator=(const MenuTableSwitchPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace menu_table_switch

#endif  // FLUTTER_PLUGIN_MENU_TABLE_SWITCH_PLUGIN_H_
