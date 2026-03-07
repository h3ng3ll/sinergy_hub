LLM Instruction: Writing Clean, Readable, and Formatted Dart Code
1️⃣ Flutter Linting Rules

Always include package:flutter_lints/flutter.yaml.

Apply these linter rules:

avoid_print: true
prefer_single_quotes: true
prefer_relative_imports: true
require_trailing_commas: true
null_check_on_nullable_type_parameter: false

Apply analyzer plugin custom_lint.

Exclude generated files: **/*.g.dart, **/*.freezed.dart, lib/generated/**.

Ignore invalid_annotation_target errors.

Formatter: always use trailing commas and preserve formatting.

2️⃣ Code Formatting Rules

Always break lines, align arguments, and use commas to make code readable.

Correct example:

Text(
'text',
style: textTheme.b32.copyWith(
color: AppColors.newCream.value,
),
),

Incorrect example (avoid):

Text(
lo.calendar,
style: textTheme.b32.copyWith(color: AppColors.newCream.value),
),

For nested expressions like Stream, Future, expand, map:

Always break arguments to multiple lines.

Always add trailing commas.

Example:

Stream<IceCandidate> listenCandidate(
String callId,
) {
return _candidates(
callId,
).snapshots().expand(
(snapshot) {
return snapshot.docChanges
.where(
(e) => e.type == DocumentChangeType.added,
).map(
(e) => IceCandidate.fromJson(
e.doc.data()!,
),
);
},
);
}
3️⃣ Numeric Literal Rules

Always write double literals with .0.

Do not use integer literals where a double is expected.

4️⃣ Domain / Data / Core Architecture Rules

Domain Layer

Contains only entities, value objects, domain interfaces, and use case contracts.

Do not include filtering, mapping, or collection extensions here.

Data Layer (Feature-Specific Extensions)

Extensions specific to one feature should go in the feature’s data layer.

Example:

lib/features/chat/data/extensions/chat_list_filter_ext.dart
lib/features/chat/data/extensions/chat_list_config_ext.dart

Core Layer (Global / Reusable Extensions)

If an extension is used across multiple features, place it in core/extensions:

lib/core/extensions/chat_list_filter_ext.dart

UseCases

Must orchestrate repositories and other use cases.

Must not contain helper methods (like _applyFilter) inside the UseCase.

If logic is simple (filter, sort), call the extension method from data or core layer.

If logic is complex (multi-step, multi-repository), extract it into a separate UseCase and call it from the main UseCase.

Example of orchestration:

final bundledChats = await _bundleChatUseCase.call(chatsDto);
final chatsWithConfig = bundledChats.applyConfigs(configs);
return chatsWithConfig.filterBy(filter);
5️⃣ UI / Bloc Interaction Rules

UI combines ChatBloc + ChatsFilterBloc, and applies extensions there.

Do not merge filtering logic into ChatBloc.

ChatBloc emits raw data; filter logic only applies in ChatsFilterBloc or UI layer.

6️⃣ Code Readability

Always maximize line breaks and indentation for readability.

Always add trailing commas for every argument list or nested expression.

Keep function chains vertical rather than inline.

✅ Summary for LLM:

Domain: pure entities and contracts.

Data: feature-specific extensions.

Core: global reusable extensions.

UseCases: orchestrators only; call extensions for filtering/sorting.

UI: combine blocs and apply extensions for final display.

Always format Dart code with trailing commas, multiline arguments, and proper indentation.