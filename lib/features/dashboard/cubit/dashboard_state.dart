import 'package:dev_journey/domain/model/dashboard_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    /// `null` until the first summary arrives.
    DashboardSummary? summary,
    String? errorMessage,
  }) = _DashboardState;
}
