import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:settings/l10n/l10n.dart';
import 'package:settings/view/pages/notifications/app_notifications_section.dart';
import 'package:settings/view/pages/notifications/global_notifications_section.dart';
import 'package:settings/view/pages/notifications/notifications_model.dart';
import 'package:settings/view/pages/settings_page.dart';
import 'package:watch_it/watch_it.dart';
import 'package:yaru/yaru.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  static Widget create(BuildContext context) =>
      ChangeNotifierProvider<NotificationsModel>(
        create: (_) => NotificationsModel(di<GSettingsService>()),
        child: const NotificationsPage(),
      );

  static Widget createTitle(BuildContext context) =>
      Text(context.l10n.notificationsPageTitle);

  static bool searchMatches(String value, BuildContext context) =>
      value.isNotEmpty
          ? context.l10n.notificationsPageTitle
              .toLowerCase()
              .contains(value.toLowerCase())
          : false;

  @override
  Widget build(BuildContext context) {
    return const SettingsPage(
      children: [
        GlobalNotificationsSection(),
        AppNotificationsSection(),
      ],
    );
  }
}
