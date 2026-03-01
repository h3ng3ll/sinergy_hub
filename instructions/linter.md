

# Apply following rules while generate any code 
    include: package:flutter_lints/flutter.yaml
    
    linter:
    
    rules:
    avoid_print: true
    prefer_single_quotes: true
    prefer_relative_imports: true
    require_trailing_commas: true
    null_check_on_nullable_type_parameter: false
    
    analyzer:
    plugins:
    - custom_lint
    
    #  enable-experiment:
    #    - dot-shorthands
    
    exclude:
    -"**/*.g.dart"
    -"**/*.freezed.dart"
    - lib/generated/**
    errors:
    invalid_annotation_target: ignore
    # Additional information about this file can be found at
    # https://dart.dev/guides/language/analysis-options
    formatter:
    trailing_commas: preserve

# Должны присутсвовать комы для переноса строк во всех доступных местах

## Нужно делать вот так 
    Text(
        'text',
        style: textTheme.b32.copyWith(
            color: AppColors.newCream.value,
        ),
    ), 
## неправильный вариант будет 
    Text(
        lo.calendar,
        style: textTheme.b32.copyWith(color: AppColors.newCream.value),
    ),