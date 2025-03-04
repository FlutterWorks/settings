import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings/services/input_source_service.dart';
import 'package:settings/view/pages/keyboard/input_source_model.dart';
import 'package:settings/view/pages/keyboard/input_source_section.dart';
import 'package:settings/view/pages/keyboard/input_source_selection_section.dart';
import 'package:settings/view/pages/keyboard/special_characters_model.dart';
import 'package:settings/view/pages/keyboard/special_characters_section.dart';
import 'package:settings/view/pages/settings_page.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

class KeyboardSettingsPage extends StatelessWidget {
  const KeyboardSettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsService = di<GSettingsService>();
    final inputSourceService = di<InputSourceService>();

    return SettingsPage(
      children: [
        ChangeNotifierProvider(
          create: (_) => InputSourceModel(settingsService, inputSourceService),
          child: const InputSourceSelectionSection(),
        ),
        ChangeNotifierProvider(
          create: (_) => InputSourceModel(settingsService, inputSourceService),
          child: const InputSourceSection(),
        ),
        ChangeNotifierProvider(
          create: (_) => SpecialCharactersModel(settingsService),
          child: const SpecialCharactersSection(),
        ),
      ],
    );
  }
}
