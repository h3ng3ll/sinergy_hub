import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../onboard_survey/domain/models/specialization/specialization.dart';

part 'text_type.freezed.dart';

@freezed
sealed class TextType with _$TextType {
  const factory TextType.text(
    String value,
  ) = TextPlain;

  const factory TextType.url(
    String value,
  ) = TextUrl;

  const factory TextType.email(
    String value,
  ) = TextEmail;
}
