import 'package:dev_journey/core/design_system/design_system.dart';
import 'package:material_ui/material_ui.dart';

/// The five tabs, in the order of the shell's branches (`app_routes.dart`).
enum AppTab {
  dashboard('Dashboard', Icons.dashboard_outlined, Icons.dashboard),
  roadmaps('Roadmaps', Icons.route_outlined, Icons.route),
  challenges('Challenges', Icons.code_outlined, Icons.code),
  analytics('Analytics', Icons.insights_outlined, Icons.insights),
  settings('Settings', Icons.settings_outlined, Icons.settings);

  const AppTab(this.label, this.icon, this.selectedIcon);

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

/// Where a drawer item leads: a tab, or a screen above the tabs.
sealed class DrawerDestination {
  const DrawerDestination();
}

final class TabDestination extends DrawerDestination {
  const TabDestination(this.index);

  final int index;
}

enum ScreenDestination implements DrawerDestination {
  notes('Notes', Icons.sticky_note_2_outlined),
  goals('Goals', Icons.flag_outlined),
  resources('Resources', Icons.local_library_outlined),
  search('Search', Icons.search),
  about('About', Icons.info_outline);

  const ScreenDestination(this.label, this.icon);

  final String label;
  final IconData icon;
}

/// The Android edition's navigation drawer: the five tabs, then the screens
/// that don't fit in a bottom bar (Notes, Goals, Resources, Search), then
/// About.
///
/// Built from `ListTile`s rather than Material's `NavigationDrawer`: its
/// destinations lay the label out in a fixed row, which overflows at large
/// text sizes, while a `ListTile` wraps and grows. The tiles keep the Material
/// 3 look (a pill-shaped indicator on the current tab) and report "selected"
/// to screen readers.
///
/// Only a tab can be selected: the other destinations push a screen above
/// the shell, and the drawer is gone by the time it shows.
class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({
    super.key,
    required this.currentTab,
    required this.onSelected,
  });

  final int currentTab;
  final ValueChanged<DrawerDestination> onSelected;

  static const screens = [
    ScreenDestination.notes,
    ScreenDestination.goals,
    ScreenDestination.resources,
    ScreenDestination.search,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xSmall),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.large,
                AppSpacing.small,
                AppSpacing.medium,
                AppSpacing.small,
              ),
              child: Semantics(
                header: true,
                child: Text('DevJourney', style: theme.textTheme.titleLarge),
              ),
            ),
            for (final tab in AppTab.values)
              _DrawerTile(
                icon: tab.index == currentTab ? tab.selectedIcon : tab.icon,
                label: tab.label,
                selected: tab.index == currentTab,
                onTap: () => onSelected(TabDestination(tab.index)),
              ),
            const _DrawerDivider(),
            for (final screen in screens)
              _DrawerTile(
                icon: screen.icon,
                label: screen.label,
                onTap: () => onSelected(screen),
              ),
            const _DrawerDivider(),
            _DrawerTile(
              icon: ScreenDestination.about.icon,
              label: ScreenDestination.about.label,
              onTap: () => onSelected(ScreenDestination.about),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small),
      child: ListTile(
        shape: const StadiumBorder(),
        selected: selected,
        selectedTileColor: scheme.secondaryContainer,
        selectedColor: scheme.onSecondaryContainer,
        iconColor: scheme.onSurfaceVariant,
        textColor: scheme.onSurfaceVariant,
        leading: Icon(icon),
        title: Text(label),
        onTap: onTap,
      ),
    );
  }
}

class _DrawerDivider extends StatelessWidget {
  const _DrawerDivider();

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(
      horizontal: AppSpacing.large,
      vertical: AppSpacing.xSmall,
    ),
    child: Divider(),
  );
}
