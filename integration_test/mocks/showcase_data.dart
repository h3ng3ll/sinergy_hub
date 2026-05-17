// Curated, presentation-quality showcase data for screenshot tests.
// NEVER imported from lib/ — strictly test-only.

import 'package:sinergy_hub/features/chat/domain/models/chat/chat.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_config/chat_config.dart';
import 'package:sinergy_hub/features/chat/domain/models/chat_message/chat_message.dart';
import 'package:sinergy_hub/features/chat/domain/models/participant_info/participant_info.dart';
import 'package:sinergy_hub/features/matches/data/models/matches_dto/matches_dto.dart';
import 'package:sinergy_hub/features/matches/domain/models/user_match/matches.dart';
import 'package:sinergy_hub/features/matches/presentation/bloc/tinder_card_cubit/tinder_card_cubit.dart';
import 'package:sinergy_hub/features/notifications/domain/models/notification/notification.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/experience/experience.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/role/role.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/skill/skill.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/specialization/specialization.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/user_profiler/user_profiler.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';

class ShowcaseData {
  ShowcaseData._();

  static const String heroUid = 'hero-user-uid';
  static const String partnerUid = 'partner-user-uid';
  static const String heroChatId = 'chat-hero-partner';
  static const String heroMatchId = '${heroUid}_$partnerUid';

  static final DateTime _now = DateTime(2026, 5, 16, 14, 30);

  static UserData hero() => UserData(
    uid: heroUid,
    avatarUrl: null,
    avatarPath: null,
    firstName: 'Alex',
    lastName: 'Reed',
    age: 29,
    aboutMe:
        'Co-founder building developer tooling. 8 years across mobile and '
        'backend. Looking for a strong product partner to ship an AI-first '
        'collaboration platform — strong opinions, lightly held.',
    profiler: UserProfiler(
      specialization: ESpecialization.fullStackDeveloper,
      role: ERole.technicalDevelopment,
      experience: EExperience.senior,
      searchingSpecializations: const [
        ESpecialization.productManager,
        ESpecialization.uiUxDesigner,
        ESpecialization.growthManager,
      ],
      skills: const [
        Skill(name: 'Flutter'),
        Skill(name: 'Dart'),
        Skill(name: 'TypeScript'),
        Skill(name: 'Node.js'),
        Skill(name: 'Firebase'),
        Skill(name: 'PostgreSQL'),
        Skill(name: 'AWS'),
        Skill(name: 'GraphQL'),
      ],
    ),
    createdAt: DateTime(2025, 6, 1),
    isOnline: true,
    lastSeen: _now,
  );

  static UserData partner() => UserData(
    uid: partnerUid,
    avatarUrl: null,
    avatarPath: null,
    firstName: 'Maya',
    lastName: 'Lin',
    age: 31,
    aboutMe:
        'Product leader from fintech. Shipped 4 products from zero to launch. '
        'Obsessed with onboarding flows and activation metrics. Looking for a '
        'technical co-founder who cares about craft.',
    profiler: UserProfiler(
      specialization: ESpecialization.productManager,
      role: ERole.productManager,
      experience: EExperience.senior,
      searchingSpecializations: const [
        ESpecialization.fullStackDeveloper,
        ESpecialization.mobileDeveloper,
        ESpecialization.techLeadCTO,
      ],
      skills: const [
        Skill(name: 'Product Strategy'),
        Skill(name: 'User Research'),
        Skill(name: 'Roadmapping'),
        Skill(name: 'Figma'),
        Skill(name: 'SQL'),
        Skill(name: 'Mixpanel'),
        Skill(name: 'OKRs'),
      ],
    ),
    createdAt: DateTime(2025, 4, 12),
    isOnline: true,
    lastSeen: _now,
  );

  static List<UserData> discoveryCandidates() => [
    partner(),
    UserData(
      uid: 'cand-2',
      firstName: 'Daniel',
      lastName: 'Okafor',
      age: 34,
      aboutMe:
          'Designer turned design lead. Building systems that scale across '
          'multi-product orgs. Looking for technical co-founders building '
          'consumer products.',
      profiler: UserProfiler(
        specialization: ESpecialization.uiUxDesigner,
        role: ERole.design,
        experience: EExperience.leadExpert,
        searchingSpecializations: const [
          ESpecialization.fullStackDeveloper,
          ESpecialization.mobileDeveloper,
        ],
        skills: const [
          Skill(name: 'Design Systems'),
          Skill(name: 'Figma'),
          Skill(name: 'Motion'),
          Skill(name: 'Prototyping'),
        ],
      ),
      createdAt: DateTime(2025, 3, 1),
      isOnline: false,
      lastSeen: _now.subtract(const Duration(hours: 6)),
    ),
    UserData(
      uid: 'cand-3',
      firstName: 'Priya',
      lastName: 'Shah',
      age: 27,
      aboutMe:
          'Backend engineer, ex-Stripe. Distributed systems, payments, ledgers. '
          'Looking for design and product partners with a clear thesis.',
      profiler: UserProfiler(
        specialization: ESpecialization.backendDeveloper,
        role: ERole.technicalDevelopment,
        experience: EExperience.senior,
        searchingSpecializations: const [
          ESpecialization.productManager,
          ESpecialization.uiUxDesigner,
        ],
        skills: const [
          Skill(name: 'Go'),
          Skill(name: 'Postgres'),
          Skill(name: 'Kafka'),
          Skill(name: 'gRPC'),
          Skill(name: 'Stripe'),
        ],
      ),
      createdAt: DateTime(2025, 7, 22),
      isOnline: true,
      lastSeen: _now,
    ),
    UserData(
      uid: 'cand-4',
      firstName: 'Sam',
      lastName: 'Hernandez',
      age: 38,
      aboutMe:
          'GTM and growth, B2B SaaS. Took two startups from 0 → \$10M ARR. '
          'Looking for technical founders ready for early go-to-market work.',
      profiler: UserProfiler(
        specialization: ESpecialization.growthManager,
        role: ERole.businessMarketing,
        experience: EExperience.leadExpert,
        searchingSpecializations: const [
          ESpecialization.fullStackDeveloper,
          ESpecialization.technicalCoFounder,
        ],
        skills: const [
          Skill(name: 'GTM Strategy'),
          Skill(name: 'Outbound'),
          Skill(name: 'Lifecycle'),
          Skill(name: 'Analytics'),
        ],
      ),
      createdAt: DateTime(2025, 2, 14),
      isOnline: false,
      lastSeen: _now.subtract(const Duration(days: 1)),
    ),
    UserData(
      uid: 'cand-5',
      firstName: 'Lin',
      lastName: 'Wu',
      age: 30,
      aboutMe:
          'iOS engineer with 10 years building apps in fintech and health. '
          'Looking for a product-driven co-founder with a clear hypothesis.',
      profiler: UserProfiler(
        specialization: ESpecialization.mobileDeveloper,
        role: ERole.technicalDevelopment,
        experience: EExperience.senior,
        searchingSpecializations: const [
          ESpecialization.productManager,
          ESpecialization.uiUxDesigner,
        ],
        skills: const [
          Skill(name: 'Swift'),
          Skill(name: 'SwiftUI'),
          Skill(name: 'Combine'),
          Skill(name: 'Kotlin'),
          Skill(name: 'CI/CD'),
        ],
      ),
      createdAt: DateTime(2025, 8, 18),
      isOnline: true,
      lastSeen: _now,
    ),
    UserData(
      uid: 'cand-6',
      firstName: 'Noor',
      lastName: 'Rahman',
      age: 35,
      aboutMe:
          'CTO/founder, two exits. Strong opinions about hiring, infra and '
          'product velocity. Looking for a product partner.',
      profiler: UserProfiler(
        specialization: ESpecialization.techLeadCTO,
        role: ERole.technicalDevelopment,
        experience: EExperience.leadExpert,
        searchingSpecializations: const [
          ESpecialization.productManager,
          ESpecialization.businessDeveloper,
        ],
        skills: const [
          Skill(name: 'Leadership'),
          Skill(name: 'Architecture'),
          Skill(name: 'Cloud'),
          Skill(name: 'Hiring'),
        ],
      ),
      createdAt: DateTime(2024, 12, 9),
      isOnline: false,
      lastSeen: _now.subtract(const Duration(days: 3)),
    ),
  ];

  static List<Chat> chats() {
    final today = _now;
    final yesterday = _now.subtract(const Duration(days: 1));
    final lastWeek = _now.subtract(const Duration(days: 6));

    Chat _make({
      required String id,
      required String partnerName,
      required String partnerUid,
      required String partnerSpec,
      required String lastMessage,
      required String lastBy,
      required DateTime sent,
    }) {
      return Chat(
        chatId: id,
        lastMessage: lastMessage,
        lastMessageSent: sent,
        lastMessageSentBy: lastBy,
        config: const ChatConfig(),
        participants: [heroUid, partnerUid],
        participantInfo: {
          heroUid: const ParticipantInfo(
            id: heroUid,
            name: 'Alex Reed',
            specialization: 'fullStackDeveloper',
          ),
          partnerUid: ParticipantInfo(
            id: partnerUid,
            name: partnerName,
            specialization: partnerSpec,
          ),
        },
        createdAt: sent.subtract(const Duration(days: 1)),
      );
    }

    return [
      _make(
        id: heroChatId,
        partnerName: 'Maya Lin',
        partnerUid: partnerUid,
        partnerSpec: 'productManager',
        lastMessage:
            'Sounds great. I can prep a 1-page brief by Thursday — does Friday work for a deep dive?',
        lastBy: partnerUid,
        sent: today.subtract(const Duration(minutes: 12)),
      ),
      _make(
        id: 'chat-2',
        partnerName: 'Daniel Okafor',
        partnerUid: 'cand-2',
        partnerSpec: 'uiUxDesigner',
        lastMessage:
            'Just sent over the prototype. Curious what you think of the new onboarding 🤝',
        lastBy: 'cand-2',
        sent: today.subtract(const Duration(hours: 2)),
      ),
      _make(
        id: 'chat-3',
        partnerName: 'Priya Shah',
        partnerUid: 'cand-3',
        partnerSpec: 'backendDeveloper',
        lastMessage: 'On it 👍',
        lastBy: heroUid,
        sent: yesterday,
      ),
      _make(
        id: 'chat-4',
        partnerName: 'Sam Hernandez',
        partnerUid: 'cand-4',
        partnerSpec: 'growthManager',
        lastMessage:
            'I think we should focus on the SMB segment first — way faster sales cycle and easier to validate pricing assumptions.',
        lastBy: 'cand-4',
        sent: yesterday.subtract(const Duration(hours: 3)),
      ),
      _make(
        id: 'chat-5',
        partnerName: 'Lin Wu',
        partnerUid: 'cand-5',
        partnerSpec: 'mobileDeveloper',
        lastMessage: 'Let me share my GitHub later tonight.',
        lastBy: 'cand-5',
        sent: _now.subtract(const Duration(days: 2)),
      ),
      _make(
        id: 'chat-6',
        partnerName: 'Noor Rahman',
        partnerUid: 'cand-6',
        partnerSpec: 'techLeadCTO',
        lastMessage:
            'Happy to chat — Tuesday 4pm UTC works for me. Send a calendar invite.',
        lastBy: 'cand-6',
        sent: lastWeek,
      ),
      _make(
        id: 'chat-7',
        partnerName: 'Yara Cohen',
        partnerUid: 'cand-7',
        partnerSpec: 'productOwner',
        lastMessage: 'thanks!',
        lastBy: heroUid,
        sent: lastWeek.subtract(const Duration(days: 1)),
      ),
      _make(
        id: 'chat-8',
        partnerName: 'Marco Bianchi',
        partnerUid: 'cand-8',
        partnerSpec: 'businessDeveloper',
        lastMessage: 'Ping me when you have the deck.',
        lastBy: heroUid,
        sent: lastWeek.subtract(const Duration(days: 2)),
      ),
    ];
  }

  static List<ChatMessage> messages() {
    final base = _now;
    DateTime t(int dh) => base.subtract(Duration(minutes: dh));
    return [
      ChatMessage(
        id: 'm1',
        message:
            "Hey Maya — really enjoyed your write-up on activation. We're "
            "thinking about the same problem from the dev tooling angle.",
        sentUid: heroUid,
        hasRead: true,
        createdAt: t(60 * 26 + 30),
      ),
      ChatMessage(
        id: 'm2',
        message:
            "Thank you! I'd love to hear more. What's the wedge you're "
            "considering? B2B dev tooling has gotten crowded.",
        sentUid: partnerUid,
        hasRead: true,
        createdAt: t(60 * 26),
      ),
      ChatMessage(
        id: 'm3',
        message:
            "We're going after the long-tail of side-project devs first. "
            "Free tier, beautiful UX, zero-config setup.",
        sentUid: heroUid,
        hasRead: true,
        createdAt: t(60 * 25),
      ),
      ChatMessage(
        id: 'm4',
        message: "Got it. Pricing strategy?",
        sentUid: partnerUid,
        hasRead: true,
        createdAt: t(60 * 24 + 30),
      ),
      ChatMessage(
        id: 'm5',
        message: "Usage-based on the API tier. Free for personal use.",
        sentUid: heroUid,
        hasRead: true,
        createdAt: t(60 * 24),
      ),
      ChatMessage(
        id: 'm6',
        message:
            "Smart. The activation curve there should be much smoother than "
            "asking for a credit card up-front.",
        sentUid: partnerUid,
        hasRead: true,
        createdAt: t(60 * 5 + 20),
      ),
      ChatMessage(
        id: 'm7',
        message: "Exactly. Curious — what's your timeline for going full-time?",
        sentUid: heroUid,
        hasRead: true,
        createdAt: t(60 * 5),
      ),
      ChatMessage(
        id: 'm8',
        message: "End of Q3. I'm wrapping up a current engagement.",
        sentUid: partnerUid,
        hasRead: true,
        createdAt: t(60 * 4 + 30),
      ),
      ChatMessage(
        id: 'm9',
        message:
            "That actually lines up well with my runway. Want to do a "
            "deeper session next week?",
        sentUid: heroUid,
        hasRead: true,
        createdAt: t(60 * 2),
      ),
      ChatMessage(
        id: 'm10',
        message: "Yes — I'll send over my prep doc beforehand.",
        sentUid: partnerUid,
        hasRead: true,
        createdAt: t(60 + 30),
      ),
      ChatMessage(
        id: 'm11',
        message: "Perfect 🙌",
        sentUid: heroUid,
        hasRead: true,
        createdAt: t(60),
      ),
      ChatMessage(
        id: 'm12',
        message:
            "Sounds great. I can prep a 1-page brief by Thursday — does "
            "Friday work for a deep dive?",
        sentUid: partnerUid,
        hasRead: false,
        createdAt: t(12),
      ),
    ];
  }

  static List<Notification> notifications() => [
    Notification(
      id: 'n1',
      uid: heroUid,
      title: 'New match!',
      description: 'You and Maya Lin matched. Say hello!',
      hasRead: false,
      createdAt: _now.subtract(const Duration(minutes: 8)),
    ),
    Notification(
      id: 'n2',
      uid: heroUid,
      title: 'New message',
      description: 'Maya Lin: "Sounds great. I can prep a 1-page brief…"',
      hasRead: false,
      createdAt: _now.subtract(const Duration(minutes: 12)),
    ),
    Notification(
      id: 'n3',
      uid: heroUid,
      title: 'Profile viewed',
      description: 'Daniel Okafor checked out your profile.',
      hasRead: true,
      createdAt: _now.subtract(const Duration(hours: 4)),
    ),
    Notification(
      id: 'n4',
      uid: heroUid,
      title: 'New match!',
      description: 'You and Priya Shah matched. Say hello!',
      hasRead: true,
      createdAt: _now.subtract(const Duration(days: 1)),
    ),
    Notification(
      id: 'n5',
      uid: heroUid,
      title: 'Weekly summary',
      description: '12 new compatible profiles for you this week.',
      hasRead: true,
      createdAt: _now.subtract(const Duration(days: 3)),
    ),
    Notification(
      id: 'n6',
      uid: heroUid,
      title: 'New message',
      description: 'Sam Hernandez: "I think we should focus on SMB first…"',
      hasRead: true,
      createdAt: _now.subtract(const Duration(days: 4)),
    ),
  ];

  static Matches matchResult() => Matches(
    matchId: heroMatchId,
    user: partner(),
    matchStatus: TinderCardStatus.liked,
    completeness: EMatchesCompleteness.twoWayMatch,
    time: _now.subtract(const Duration(minutes: 5)),
    align: 9,
    experienceScore: 9,
    skillsMatch: 8,
    visionScore: 9,
  );

  static MatchesDto matchDto() => MatchesDto(
    answeredUids: const [heroUid, partnerUid],
    completeness: EMatchesCompleteness.twoWayMatch,
    experienceScore: 9,
    matchId: heroMatchId,
    matchStatus: TinderCardStatus.liked,
    skillsMatch: 8,
    skillsScore: 8,
    time: _now.subtract(const Duration(minutes: 5)),
    users: const [heroUid, partnerUid],
    visionScore: 9,
  );

  static List<String> skills() => const [
    'Flutter',
    'Dart',
    'TypeScript',
    'React',
    'Node.js',
    'Python',
    'Go',
    'Kotlin',
    'Swift',
    'Firebase',
    'PostgreSQL',
    'MongoDB',
    'AWS',
    'GCP',
    'Docker',
    'Kubernetes',
    'GraphQL',
    'gRPC',
    'Figma',
    'Mixpanel',
  ];
}
