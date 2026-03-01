
You are working in a Flutter project with Clean Architecture.

# Архитектура проекта
    project/
    │
    ├── android/
    ├── ios/
    ├── build/
    ├── .dart_tool/
    ├── .idea/
    │
    ├── assets/
    │   ├── icons/
    │   ├── images/
    │   ├── lottie/
    │   └── sounds/
    │
    ├── lib/
    │
    │   ├── main.dart
    │   ├── firebase_options.dart
    │
    │   ├── gen/
    │   ├── core/                     # ОБЩЕЕ ЯДРО
    │   │   ├── bloc/
    │   │   │   └── app_observer.dart
    │   │   │
    │   │   ├── databases/
    │   │   │   └── shared_preferences_database.dart
    │   │   │
    │   │   ├── di/
    │   │   │   └── injection.dart
    │   │   │
    │   │   ├── models/
    │   │   │   └── pageable/
    │   │   │
    │   │   ├── resources/
    │   │   │   ├── colors/
    │   │   │   ├── text/
    │   │   │   └── translations/
    │   │   │
    │   │   ├── routes/
    │   │   │   └── init_router/
    │   │   │
    │   │   ├── presentation/
    │   │   │   └── root_page/
    │   │   │
    │   │   ├── services/             # ГЛОБАЛЬНЫЕ СЕРВИСЫ
    │   │   │   ├── audio_service.dart
    │   │   │   ├── firebase/
    │   │   │   ├── local_notification_service.dart
    │   │   │   ├── permission_requester_service.dart
    │   │   │   ├── ui_message_service.dart
    │   │   │   └── webrtc_service.dart
    │   │   │
    │   │   ├── utils/
    │   │   │   ├── converters/
    │   │   │   ├── extensions/
    │   │   │   └── shader_painter.dart
    │   │   │
    │   │   └── widgets/              # ПЕРЕИСПОЛЬЗУЕМЫЕ ВИДЖЕТЫ
    │   │
    │   │
    │   ├── features/                # ВСЕ ФИЧИ
    │   │
    │   │   ├── auth/
    │   │   ├── calls/
    │   │   ├── chat/
    │   │   ├── home/
    │   │   ├── matches/
    │   │   ├── notifications/
    │   │   ├── onboard_survey/
    │   │   └── user/
    │   │
    │   │
    │   │   └── <feature_name>/
    │   │       │
    │   │       ├── data/             # DATA LAYER
    │   │       │   └── repositories/
    │   │       │
    │   │       ├── domain/           # DOMAIN LAYER
    │   │       │   ├── models/
    │   │       │   ├── repositories/
    │   │       │   └── use_cases/
    │   │       │
    │   │       ├── presentation/     # UI LAYER
    │   │       │   ├── bloc/
    │   │       │   ├── pages/
    │   │       │   └── overlay/
    │   │       │
    │   │       └── di/               # FEATURE DI
    │   │           └── *_injection.dart
    │
    └── instructions/

📌 core/ — ОБЩЕЕ ЯДРО
##  Назначение - Всё, что:

    ✔ используется в нескольких фичах
    ✔ не относится к бизнес-логике конкретной фичи
    ✔ инфраструктура

    core/services/

####  Глобальные сервисы:

    audio_service
    webrtc
    notifications
    firebase
    permissions

#### 👉 Используются через DI.
    core/di/injection.dart

#### Глобальный DI:
    Dio
    Firebase
    Services
    SharedPrefs

#### НЕЛЬЗЯ:
    писать тут бизнес-логику фич

## core/routes/
    -   Вся навигация.
    -   Фичи НЕ управляют роутером напрямую.

## core/resources/
### UI-константы:
    цвета
    строки
    переводы
    темы

## core/utils/
### Extensions, helpers.
    Без бизнес-логики.

# 📌 features/ — ВСЯ БИЗНЕС-ЛОГИКА
## Каждая фича:
    features/<feature>/
Изолирована.

# 🔹 domain/ — БИЗНЕС-ЯДРО
    models/
-   Чистые сущности.
-   Без Flutter.

# repositories/
## Абстракции
    abstract class ICallsRepository
# use_cases/
## 1 действие = 1 файл
    accept_call_use_case
    start_call_use_case
## UseCase = orchestration.

# 🔹 data/ — ИНФРАСТРУКТУРА
## Реализация domain-интерфейсов.
    FirebaseCallsRepository implements ICallsRepository
## Тут:

-   API
-   Firebase
-   SQLite
-   REST

## Domain про это НЕ знает.


# 🔹 presentation/ — UI
## bloc/ - Только orchestration.
-   BLoC / Cubit
## НЕ ходит напрямую в Firebase.

## features/$feat_name/pages/ - Тут описываються екраны
## features/$feat_name/pages/$page_name/overlay/ - Описываються оверлеи екрана
## features/$feat_name/pages/$page_name/dialogs/ - Описываються диалоги
## features/$feat_name/pages/$page_name/dialogs/**modal_sheet/**modal_sheet.dart
    Тут будет создаваться конкретное модальное окно 
## features/$feat_name/pages/$page_name/dialogs/**dialog/**dialog.dart
    Тут будет создаваться конкретный диалог
# features/$feat_name/di/
Регистрация фичи:
void inject$feat_name()

# Как добавлять новую фичу (алгоритм)

1. Create features/<feat_name>/
2. Create layers: data/domain/presentation/di
3. Describe domain models
4. Create repository interface
5. Create use cases
6. Implement repository
7. Create Bloc
8. Create Pages
9. Register DI
10. Add routes
