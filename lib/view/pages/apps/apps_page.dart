import 'dart:io';

import 'package:flutter/material.dart';
import 'package:settings/constants.dart';
import 'package:settings/l10n/l10n.dart';
import 'package:settings/view/pages/settings_page.dart';
import 'package:yaru/yaru.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  static Widget create(BuildContext context) => const AppsPage();

  static Widget createTitle(BuildContext context) =>
      Text(context.l10n.appsPageTitle);

  static bool searchMatches(String value, BuildContext context) => value
          .isNotEmpty
      ? context.l10n.appsPageTitle.toLowerCase().contains(value.toLowerCase())
      : false;

  @override
  Widget build(BuildContext context) {
    return SettingsPage(
      children: [
        SizedBox(
          width: kDefaultWidth,
          child: YaruSection(
            child: YaruTile(
              leading: const Text('Apps can be managed in the App Store'),
              trailing: ElevatedButton.icon(
                onPressed: () => Process.start('snap-store', []),
                label: const Text('Open'),
                icon: const Icon(YaruIcons.application_bag),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
