import 'package:dev_journey/domain/model/learning_analytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_state.freezed.dart';

enum AnalyticsStatus { loading, ready, failure }

@freezed
abstract class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState({
    @Default(AnalyticsStatus.loading) AnalyticsStatus status,
    LearningAnalytics? analytics,
  }) = _AnalyticsState;
}
