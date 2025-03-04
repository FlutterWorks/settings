import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:settings/constants.dart';
import 'package:settings/schemas/schemas.dart';
import 'package:settings/services/keyboard_service.dart';
import 'package:settings/view/common/settings_section.dart';
import 'package:settings/view/pages/keyboard/keyboard_shortcut_row.dart';
import 'package:settings/view/pages/keyboard/keyboard_shortcuts_model.dart';
import 'package:settings/view/pages/settings_page.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

class KeyboardShortcutsPage extends StatelessWidget {
  const KeyboardShortcutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsPage(
      children: [
        ChangeNotifierProvider(
          create: (_) => KeyboardShortcutsModel(
            keyboard: di<KeyboardService>(),
            settings: di<GSettingsService>(),
            schemaId: schemaWmKeybindings,
          ),
          child: const SettingsSection(
            width: kDefaultWidth,
            headline: Text('Navigation Shortcuts'),
            children: [
              KeyboardShortcutRow(
                label: 'Switch windows',
                shortcutId: 'switch-windows',
              ),
              KeyboardShortcutRow(
                label: 'Switch windows backward',
                shortcutId: 'switch-windows-backward',
              ),
            ],
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => KeyboardShortcutsModel(
            keyboard: di<KeyboardService>(),
            settings: di<GSettingsService>(),
            schemaId: schemaGnomeShellKeybinding,
          ),
          child: const SettingsSection(
            width: kDefaultWidth,
            headline: Text('System'),
            children: [
              KeyboardShortcutRow(
                label: 'Toggle Apps Grid',
                shortcutId: 'toggle-application-view',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
