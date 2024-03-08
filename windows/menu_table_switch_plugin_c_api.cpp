#include "include/menu_table_switch/menu_table_switch_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "menu_table_switch_plugin.h"

void MenuTableSwitchPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  menu_table_switch::MenuTableSwitchPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
