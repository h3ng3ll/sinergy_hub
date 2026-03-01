import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../user/domain/models/user_data/user_data.dart';
import '../../../../matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';

part 'call.g.dart';

part 'call.freezed.dart';

enum ECallStatus {
  idle,
  calling,
  loading,
  accepted,
  ended,
  declined,
}

extension CallX on Call {
  bool get isCalling => status == ECallStatus.calling;

  bool get isAccepted => status == ECallStatus.accepted;

  bool get isDeclined => status == ECallStatus.declined;

  bool get isEnded => status == ECallStatus.ended;
}

@freezed
sealed class Call with _$Call {
  const factory Call({
    @Default('') String id,
    @Default('') String callerId,
    @Default('') String calleeId,
    @Default(ECallStatus.idle) ECallStatus status,
    String? offerSdp,
    String? answerSdp,
    required DateTime createdAt,
    DateTime? endedAt,
  }) = _Call;

  factory Call.fromJson(Map<String, Object?> json) => _$CallFromJson(json);
}
