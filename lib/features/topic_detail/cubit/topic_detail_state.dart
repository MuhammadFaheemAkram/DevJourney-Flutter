import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_detail_state.freezed.dart';

enum TopicDetailStatus { loading, found, notFound }

@freezed
abstract class TopicDetailState with _$TopicDetailState {
  const factory TopicDetailState({
    required CalendarDate today,
    @Default(TopicDetailStatus.loading) TopicDetailStatus status,
    TopicDetails? details,

    /// Why the last change failed; [errorSerial] makes each failure
    /// distinct.
    String? errorMessage,
    @Default(0) int errorSerial,
  }) = _TopicDetailState;
}
