import 'package:dev_journey/domain/model/calendar_date.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/model/resource_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_detail_state.freezed.dart';

enum TopicDetailStatus { loading, found, notFound }

@freezed
abstract class TopicDetailState with _$TopicDetailState {
  const factory TopicDetailState({
    /// When the state was made: "today" for the completion, "5 min ago"
    /// for notes.
    required DateTime now,
    @Default(TopicDetailStatus.loading) TopicDetailStatus status,
    TopicDetails? details,

    /// The resources for this topic, in catalog order.
    @Default(<ResourceItem>[]) List<ResourceItem> resources,

    /// The notes attached to this topic, newest edit first.
    @Default(<NoteItem>[]) List<NoteItem> notes,

    /// Why the last change failed; [errorSerial] makes each failure
    /// distinct.
    String? errorMessage,
    @Default(0) int errorSerial,
  }) = _TopicDetailState;

  const TopicDetailState._();

  CalendarDate get today => CalendarDate.fromDateTime(now);
}
