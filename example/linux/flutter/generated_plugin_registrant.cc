//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <menu_table_switch/menu_table_switch_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) menu_table_switch_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MenuTableSwitchPlugin");
  menu_table_switch_plugin_register_with_registrar(menu_table_switch_registrar);
}
