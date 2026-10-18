import 'package:material_ui/material_ui.dart';

/// A circular progress indicator with the percentage inside. Screen readers
/// hear "40 percent complete".
class ProgressRing extends StatelessWidget {
  const ProgressRing({super.key, required this.ratio, this.size = 64});

  /// 0 to 1.
  final double ratio;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent = (ratio * 100).round();
    return Semantics(
      label: '$percent percent complete',
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: size,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: ratio,
              strokeWidth: size / 10,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              strokeCap: StrokeCap.round,
            ),
            Center(
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.all(size / 6),
                  child: Text('$percent%', style: theme.textTheme.titleSmall),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
