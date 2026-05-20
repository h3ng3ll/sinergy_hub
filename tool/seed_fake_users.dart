import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:sinergy_hub/core/services/firebase/firebase_firestore_service.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/experience/experience.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/role/role.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/skill/skill.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/specialization/specialization.dart';
import 'package:sinergy_hub/features/onboard_survey/domain/models/user_profiler/user_profiler.dart';
import 'package:sinergy_hub/features/user/domain/models/user_data/user_data.dart';
import 'package:sinergy_hub/firebase.dart';

//  flutter run -t   tool/seed_fake_users.dart

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  final List<UserData> users = [
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Oleksandr',
      lastName: 'Kovalenko',
      age: 28,
      aboutMe:
          'Passionate backend engineer who loves building scalable APIs and distributed systems. Open to co-founding a SaaS product.',
      profiler: UserProfiler(
        specialization: ESpecialization.backendDeveloper,
        role: ERole.technicalDevelopment,
        experience: EExperience.senior,
        searchingSpecializations: [
          ESpecialization.productManager,
          ESpecialization.uiUxDesigner,
        ],
        skills: [
          Skill(name: 'Node.js'),
          Skill(name: 'PostgreSQL'),
          Skill(name: 'Docker'),
          Skill(name: 'Kubernetes'),
          Skill(name: 'Redis'),
        ],
      ),
      createdAt: DateTime(2024, 11, 3),
      lastSeen: DateTime(2025, 4, 10),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Maryna',
      lastName: 'Bondarenko',
      age: 25,
      aboutMe:
          'UI/UX designer with 3 years of experience in mobile-first SaaS products. Looking for a technical co-founder to bring ideas to life.',
      profiler: UserProfiler(
        specialization: ESpecialization.uiUxDesigner,
        role: ERole.design,
        experience: EExperience.middle,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.mobileDeveloper,
        ],
        skills: [
          Skill(name: 'Figma'),
          Skill(name: 'Prototyping'),
          Skill(name: 'Usability Testing'),
          Skill(name: 'Design Systems'),
          Skill(name: 'User Research'),
        ],
      ),
      createdAt: DateTime(2024, 9, 17),
      lastSeen: DateTime(2025, 4, 14),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Dmytro',
      lastName: 'Savchenko',
      age: 32,
      aboutMe:
          'Full-stack developer with strong React + NestJS background. Building a B2B platform in the HR-tech space. Need a growth co-founder.',
      profiler: UserProfiler(
        specialization: ESpecialization.fullStackDeveloper,
        role: ERole.technicalDevelopment,
        experience: EExperience.senior,
        searchingSpecializations: [
          ESpecialization.growthManager,
          ESpecialization.marketingManager,
        ],
        skills: [
          Skill(name: 'React'),
          Skill(name: 'NestJS'),
          Skill(name: 'TypeScript'),
          Skill(name: 'PostgreSQL'),
          Skill(name: 'Docker'),
        ],
      ),
      createdAt: DateTime(2024, 8, 5),
      lastSeen: DateTime(2025, 4, 15),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Anastasiia',
      lastName: 'Shevchenko',
      age: 30,
      aboutMe:
          'Product manager with 5 years in fintech. Expert at turning customer pain into shipped features. Looking for a tech co-founder.',
      profiler: UserProfiler(
        specialization: ESpecialization.productManager,
        role: ERole.productManager,
        experience: EExperience.senior,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.fullStackDeveloper,
        ],
        skills: [
          Skill(name: 'OKRs'),
          Skill(name: 'User Research'),
          Skill(name: 'Roadmap Planning'),
          Skill(name: 'A/B Testing'),
          Skill(name: 'Amplitude'),
        ],
      ),
      createdAt: DateTime(2024, 10, 22),
      lastSeen: DateTime(2025, 4, 16),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Ivan',
      lastName: 'Lysenko',
      age: 27,
      aboutMe:
          'Flutter developer with 4 years of experience. Shipped 6 apps on App Store and Play Store. Interested in joining an early-stage startup.',
      profiler: UserProfiler(
        specialization: ESpecialization.mobileDeveloper,
        role: ERole.technicalDevelopment,
        experience: EExperience.middle,
        searchingSpecializations: [
          ESpecialization.productDesigner,
          ESpecialization.nonTechnicalCoFounder,
        ],
        skills: [
          Skill(name: 'Flutter'),
          Skill(name: 'Dart'),
          Skill(name: 'Firebase'),
          Skill(name: 'BLoC'),
          Skill(name: 'Riverpod'),
        ],
      ),
      createdAt: DateTime(2025, 1, 8),
      lastSeen: DateTime(2025, 4, 17),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Kateryna',
      lastName: 'Moroz',
      age: 29,
      aboutMe:
          'Growth manager with deep expertise in PLG strategies and funnel optimization. Ex-Grammarly. Seeking a tech partner for an edtech venture.',
      profiler: UserProfiler(
        specialization: ESpecialization.growthManager,
        role: ERole.businessMarketing,
        experience: EExperience.senior,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.backendDeveloper,
        ],
        skills: [
          Skill(name: 'Product-Led Growth'),
          Skill(name: 'A/B Testing'),
          Skill(name: 'Amplitude'),
          Skill(name: 'Funnel Analysis'),
          Skill(name: 'SQL'),
        ],
      ),
      createdAt: DateTime(2024, 12, 1),
      lastSeen: DateTime(2025, 4, 13),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Bohdan',
      lastName: 'Tkachenko',
      age: 35,
      aboutMe:
          'DevOps / Platform engineer. 8+ years building cloud infra on AWS. Co-founded and exited one startup. Ready for the next chapter.',
      profiler: UserProfiler(
        specialization: ESpecialization.devopsEngineer,
        role: ERole.technicalDevelopment,
        experience: EExperience.leadExpert,
        searchingSpecializations: [
          ESpecialization.nonTechnicalCoFounder,
          ESpecialization.salesManager,
        ],
        skills: [
          Skill(name: 'Kubernetes'),
          Skill(name: 'Terraform'),
          Skill(name: 'AWS'),
          Skill(name: 'CI/CD'),
          Skill(name: 'Prometheus'),
        ],
      ),
      createdAt: DateTime(2024, 7, 19),
      lastSeen: DateTime(2025, 4, 11),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Sophia',
      lastName: 'Kravchuk',
      age: 24,
      aboutMe:
          'Junior frontend developer passionate about React and accessibility. Looking for a startup to grow with.',
      profiler: UserProfiler(
        specialization: ESpecialization.frontendDeveloper,
        role: ERole.technicalDevelopment,
        experience: EExperience.junior,
        searchingSpecializations: [
          ESpecialization.fullStackDeveloper,
          ESpecialization.productManager,
        ],
        skills: [
          Skill(name: 'React'),
          Skill(name: 'TailwindCSS'),
          Skill(name: 'TypeScript'),
          Skill(name: 'Figma'),
          Skill(name: 'Web Accessibility (WCAG 2.1)'),
        ],
      ),
      createdAt: DateTime(2025, 2, 14),
      lastSeen: DateTime(2025, 4, 16),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Maksym',
      lastName: 'Petrenko',
      age: 31,
      aboutMe:
          'ML engineer focused on NLP and recommendation systems. Looking to join or co-found an AI-first product startup.',
      profiler: UserProfiler(
        specialization: ESpecialization.dataScientistMLEngineer,
        role: ERole.technicalDevelopment,
        experience: EExperience.senior,
        searchingSpecializations: [
          ESpecialization.productManager,
          ESpecialization.nonTechnicalCoFounder,
        ],
        skills: [
          Skill(name: 'PyTorch'),
          Skill(name: 'Hugging Face Transformers'),
          Skill(name: 'Python'),
          Skill(name: 'RAG (Retrieval-Augmented Generation)'),
          Skill(name: 'MLflow'),
        ],
      ),
      createdAt: DateTime(2024, 6, 30),
      lastSeen: DateTime(2025, 4, 9),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Olena',
      lastName: 'Hrytsenko',
      age: 33,
      aboutMe:
          'Sales manager with 7 years in B2B SaaS. Closed deals from €10K to €500K ARR. Looking for a technical partner to build a sales-enablement tool.',
      profiler: UserProfiler(
        specialization: ESpecialization.salesManager,
        role: ERole.businessMarketing,
        experience: EExperience.senior,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.fullStackDeveloper,
        ],
        skills: [
          Skill(name: 'B2B Sales'),
          Skill(name: 'MEDDIC / MEDDPICC'),
          Skill(name: 'Salesforce CRM'),
          Skill(name: 'Pipeline Management'),
          Skill(name: 'Revenue Forecasting'),
        ],
      ),
      createdAt: DateTime(2024, 11, 25),
      lastSeen: DateTime(2025, 4, 15),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Artem',
      lastName: 'Vovk',
      age: 26,
      aboutMe:
          'QA automation engineer with expertise in Playwright and CI/CD integration. Interested in quality-first startup teams.',
      profiler: UserProfiler(
        specialization: ESpecialization.qaTestAutomation,
        role: ERole.technicalDevelopment,
        experience: EExperience.middle,
        searchingSpecializations: [
          ESpecialization.fullStackDeveloper,
          ESpecialization.backendDeveloper,
        ],
        skills: [
          Skill(name: 'Playwright'),
          Skill(name: 'Cypress'),
          Skill(name: 'Jest'),
          Skill(name: 'CI/CD Integration for QA'),
          Skill(name: 'API Testing'),
        ],
      ),
      createdAt: DateTime(2025, 3, 2),
      lastSeen: DateTime(2025, 4, 14),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Oksana',
      lastName: 'Sydorenko',
      age: 38,
      aboutMe:
          'CTO with 10+ years in product engineering. Led teams of 40+ engineers at two scale-ups. Now building something new in climate-tech.',
      profiler: UserProfiler(
        specialization: ESpecialization.techLeadCTO,
        role: ERole.technicalDevelopment,
        experience: EExperience.leadExpert,
        searchingSpecializations: [
          ESpecialization.nonTechnicalCoFounder,
          ESpecialization.businessDeveloper,
        ],
        skills: [
          Skill(name: 'System Architecture Design'),
          Skill(name: 'Engineering Culture Building'),
          Skill(name: 'OKRs (Objectives & Key Results)'),
          Skill(name: 'Microservices Architecture'),
          Skill(name: 'SRE Practices'),
        ],
      ),
      createdAt: DateTime(2024, 5, 11),
      lastSeen: DateTime(2025, 4, 17),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Vitaliy',
      lastName: 'Bilous',
      age: 29,
      aboutMe:
          'Product designer with a background in B2C mobile apps. Worked at a top-10 Ukrainian startup. Looking to join a founding team.',
      profiler: UserProfiler(
        specialization: ESpecialization.productDesigner,
        role: ERole.design,
        experience: EExperience.middle,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.mobileDeveloper,
        ],
        skills: [
          Skill(name: 'End-to-End Product Design'),
          Skill(name: 'Figma (Advanced)'),
          Skill(name: 'Design Systems (Building from scratch)'),
          Skill(name: 'User Research'),
          Skill(name: 'Onboarding Flow Design'),
        ],
      ),
      createdAt: DateTime(2024, 10, 8),
      lastSeen: DateTime(2025, 4, 12),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Nataliia',
      lastName: 'Romanenko',
      age: 27,
      aboutMe:
          'Marketing manager specialized in content-led growth and SEO. Grew a SaaS blog from 0 to 80K monthly visits. Looking for a startup to lead growth.',
      profiler: UserProfiler(
        specialization: ESpecialization.marketingManager,
        role: ERole.businessMarketing,
        experience: EExperience.middle,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.productManager,
        ],
        skills: [
          Skill(name: 'Content Marketing'),
          Skill(name: 'SEO Basics'),
          Skill(name: 'Google Ads (Search, Display, Shopping, YouTube)'),
          Skill(name: 'Email Marketing'),
          Skill(name: 'Google Analytics 4 (GA4)'),
        ],
      ),
      createdAt: DateTime(2025, 1, 20),
      lastSeen: DateTime(2025, 4, 15),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Yevhen',
      lastName: 'Kuznietsov',
      age: 34,
      aboutMe:
          'Business developer with 8 years of building partnerships in the EU market. Looking to co-found a B2B marketplace.',
      profiler: UserProfiler(
        specialization: ESpecialization.businessDeveloper,
        role: ERole.businessMarketing,
        experience: EExperience.senior,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.productManager,
        ],
        skills: [
          Skill(name: 'Partnership Strategy'),
          Skill(name: 'Business Case Development'),
          Skill(name: 'Market Sizing (TAM, SAM, SOM)'),
          Skill(name: 'CRM for BD (Salesforce, HubSpot)'),
          Skill(name: 'Contract Negotiation'),
        ],
      ),
      createdAt: DateTime(2024, 9, 3),
      lastSeen: DateTime(2025, 4, 10),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Daryna',
      lastName: 'Kovalchuk',
      age: 23,
      aboutMe:
          'Junior mobile developer (React Native). Passionate about accessibility and great UX on mobile. Actively looking for a startup team to join.',
      profiler: UserProfiler(
        specialization: ESpecialization.mobileDeveloper,
        role: ERole.technicalDevelopment,
        experience: EExperience.junior,
        searchingSpecializations: [
          ESpecialization.productDesigner,
          ESpecialization.productManager,
        ],
        skills: [
          Skill(name: 'React Native'),
          Skill(name: 'Expo'),
          Skill(name: 'TypeScript'),
          Skill(name: 'Firebase'),
          Skill(name: 'Redux (React Native)'),
        ],
      ),
      createdAt: DateTime(2025, 3, 15),
      lastSeen: DateTime(2025, 4, 16),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Serhii',
      lastName: 'Marchenko',
      age: 40,
      aboutMe:
          'Non-technical co-founder with 2 previous exits in logistics-tech. Strong ops, fundraising, and BD background. Ready to go again.',
      profiler: UserProfiler(
        specialization: ESpecialization.nonTechnicalCoFounder,
        role: ERole.other,
        experience: EExperience.leadExpert,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.techLeadCTO,
        ],
        skills: [
          Skill(name: 'Fundraising Strategy (Pre-seed, Seed, Series A)'),
          Skill(name: 'Pitch Deck Creation'),
          Skill(name: 'Go-to-Market Strategy'),
          Skill(
            name: 'Business Model Design (Lean Canvas, Business Model Canvas)',
          ),
          Skill(name: 'Investor Relations'),
        ],
      ),
      createdAt: DateTime(2024, 4, 29),
      lastSeen: DateTime(2025, 4, 17),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Yuliia',
      lastName: 'Fedorenko',
      age: 31,
      aboutMe:
          'Product owner in a fintech scale-up. Expert at stakeholder alignment and rapid backlog delivery. Exploring co-founding an insurtech startup.',
      profiler: UserProfiler(
        specialization: ESpecialization.productOwner,
        role: ERole.productManager,
        experience: EExperience.senior,
        searchingSpecializations: [
          ESpecialization.technicalCoFounder,
          ESpecialization.dataScientistMLEngineer,
        ],
        skills: [
          Skill(name: 'Product Backlog Management'),
          Skill(name: 'User Stories Writing'),
          Skill(name: 'Sprint Planning'),
          Skill(name: 'Stakeholder Communication'),
          Skill(name: 'JIRA'),
        ],
      ),
      createdAt: DateTime(2024, 8, 18),
      lastSeen: DateTime(2025, 4, 13),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Andrii',
      lastName: 'Yaremchuk',
      age: 36,
      aboutMe:
          'Technical co-founder profile: full-stack + cloud. Shipped 3 MVPs in under 6 months. Currently building a no-code automation tool.',
      profiler: UserProfiler(
        specialization: ESpecialization.technicalCoFounder,
        role: ERole.technicalDevelopment,
        experience: EExperience.leadExpert,
        searchingSpecializations: [
          ESpecialization.growthManager,
          ESpecialization.salesManager,
        ],
        skills: [
          Skill(name: '0-to-1 Product Development'),
          Skill(name: 'Full-Stack Development'),
          Skill(name: 'Cloud Architecture (AWS/GCP/Azure)'),
          Skill(name: 'LLM APIs Integration (OpenAI, Anthropic)'),
          Skill(name: 'Serverless Architecture'),
        ],
      ),
      createdAt: DateTime(2024, 7, 7),
      lastSeen: DateTime(2025, 4, 17),
    ),
    UserData(
      uid: 'fake_placeholder',
      firstName: 'Iryna',
      lastName: 'Ponomarenko',
      age: 22,
      aboutMe:
          'Frontend developer, recent bootcamp graduate. Strong in React and TailwindCSS. Looking for a first startup experience.',
      profiler: UserProfiler(
        specialization: ESpecialization.frontendDeveloper,
        role: ERole.technicalDevelopment,
        experience: EExperience.junior,
        searchingSpecializations: [
          ESpecialization.fullStackDeveloper,
          ESpecialization.uiUxDesigner,
        ],
        skills: [
          Skill(name: 'React'),
          Skill(name: 'TailwindCSS'),
          Skill(name: 'JavaScript (ES6+)'),
          Skill(name: 'CSS Grid'),
          Skill(name: 'Git'),
        ],
      ),
      createdAt: DateTime(2025, 4, 1),
      lastSeen: DateTime(2025, 4, 16),
    ),
  ];
  final firestore = FirebaseFirestore.instance;

  final col = firestore.collection(
    'fakeUsers',
  );
  for (int i = 0; i < 20; i++) {
    final DocRef doc = col.doc();
    final uid = 'fake_${doc.id}';
    users[i] = users[i].copyWith(
      uid: uid,
    );
    await col
        .doc(
          uid,
        )
        .set(
          users[i].toJson(),
        );
    print('✅ Created $i user');
  }
  print('✅ Done');

  exit(0);
}
