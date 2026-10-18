// The fixed vocabularies of the learning catalog. Enums are stored by name
// (drift's `textEnum`, json_serializable's default), so their names are part
// of the database and the API: renaming one needs a migration.

/// What a roadmap is about: the Roadmaps tab filters by it.
enum RoadmapCategory { mobile, backend, ai, architecture }

/// How demanding a topic or a challenge is.
enum Difficulty { beginner, intermediate, advanced }

/// The kind of a learning resource.
enum ResourceType { article, video, documentation, course }

/// What a coding challenge practises.
enum ChallengeCategory { dart, ui, sql, systemDesign }

/// Where the user is with a challenge.
enum ChallengeStatus { todo, inProgress, done }

/// What a goal counts: completions (counted automatically) or check-ins.
enum GoalKind { topics, challenges, custom }

/// How often a goal starts over.
enum GoalPeriod { daily, weekly, monthly }
