import 'package:flutter/material.dart';
import 'package:nm/nm.dart';
import 'package:provider/provider.dart';
import 'package:settings/constants.dart';
import 'package:settings/l10n/l10n.dart';
import 'package:settings/view/common/section_description.dart';
import 'package:settings/view/common/settings_section.dart';
import 'package:settings/view/common/yaru_switch_row.dart';
import 'package:settings/view/pages/privacy/connectivity_model.dart';
import 'package:settings/view/pages/settings_page.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

class ConnectivityPage extends StatefulWidget {
  const ConnectivityPage({super.key});

  static Widget create(BuildContext context) => ChangeNotifierProvider(
        create: (_) => ConnectivityModel(getService<NetworkManagerClient>()),
        child: const ConnectivityPage(),
      );

  @override
  State<ConnectivityPage> createState() => _ConnectivityPageState();
}

class _ConnectivityPageState extends State<ConnectivityPage> {
  @override
  void initState() {
    final model = context.read<ConnectivityModel>();
    model.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ConnectivityModel>();
    return SettingsPage(
      children: [
        SectionDescription(
          width: kDefaultWidth,
          text: context.l10n.checkConnectivityDescription,
        ),
        SettingsSection(
          width: kDefaultWidth,
          children: [
            YaruSwitchRow(
              enabled: model.checkConnectiviy != null,
              trailingWidget: Text(context.l10n.checkConnectivityLabel),
              value: model.checkConnectiviy,
              onChanged: (v) => model.checkConnectiviy = v,
            ),
          ],
        ),
      ],
    );
  }
}
