enum SwimmerLevel {
  beginner('Beginner'),
  intermediate('Intermediate'),
  advanced('Advanced'),
  elite('Elite');

  final String name;
  const SwimmerLevel(this.name);

  // Swimmer level threshold limits in seconds
  static const int eliteThreshold = 70;        // < 70s is Elite
  static const int advancedThreshold = 90;     // < 90s is Advanced
  static const int intermediateThreshold = 120; // < 120s is Intermediate

  static SwimmerLevel fromSeconds(int totalSeconds) {
    if (totalSeconds < eliteThreshold) {
      return SwimmerLevel.elite;
    } else if (totalSeconds < advancedThreshold) {
      return SwimmerLevel.advanced;
    } else if (totalSeconds < intermediateThreshold) {
      return SwimmerLevel.intermediate;
    } else {
      return SwimmerLevel.beginner;
    }
  }
}
