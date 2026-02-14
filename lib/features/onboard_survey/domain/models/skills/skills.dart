import '../../../../../../../gen/assets.gen.dart';
import '../skill/skill.dart';

/// Global registry of all skills.
/// Allows access by enum key: `Skills.all[ESkill.python]`
abstract class Skills {
  static final Map<ESkill, Skill> all = {
    ESkill.javaScript: Skill(
      name: 'JavaScript',
      // specialization: ESkill.javaScript,
    ),
    ESkill.react: Skill(
      name: 'React',
      // specialization: ESkill.react,
    ),
    ESkill.nodeJs: Skill(
      name: 'Node.js',
      // specialization: ESkill.nodeJs,
    ),
    ESkill.python: Skill(
      name: 'Python',
      // specialization: ESkill.python,
    ),
    ESkill.mongoDB: Skill(
      name: 'MongoDB',
      // specialization: ESkill.mongoDB,
    ),
    ESkill.aws: Skill(
      name: 'AWS',
      // specialization: ESkill.aws,
    ),
    ESkill.docker: Skill(
      name: 'Docker',
      // specialization: ESkill.docker,
    ),
    ESkill.graphql: Skill(
      name: 'GraphQL',
      // specialization: ESkill.graphql,
    ),
    ESkill.typescript: Skill(
      name: 'TypeScript',
      // specialization: ESkill.typescript,
    ),
    ESkill.postgresql: Skill(
      name: 'PostgreSQL',
      // specialization: ESkill.postgresql,
    ),
    ESkill.redis: Skill(
      name: 'Redis',
      // specialization: ESkill.redis,
    ),
    ESkill.kubernetes: Skill(
      name: 'Kubernetes',
      // specialization: ESkill.kubernetes,
    ),
    ESkill.firebase: Skill(
      name: 'Firebase',
      // specialization: ESkill.firebase,
    ),
    ESkill.stripe: Skill(
      name: 'Stripe',
      // specialization: ESkill.stripe,
    ),
    ESkill.figma: Skill(
      name: 'Figma',
      // specialization: ESkill.figma,
    ),
    ESkill.jira: Skill(
      name: 'Jira',
      // specialization: ESkill.jira,
    ),
    ESkill.git: Skill(
      name: 'Git',
      // specialization: ESkill.git,
    ),
  };

  static Skill get(ESkill key) => all[key]!;
}
