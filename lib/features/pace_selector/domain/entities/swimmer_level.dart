enum SwimmerLevel {
  beginner('Beginner'),
  intermediate('Intermediate'),
  advanced('Advanced'),
  elite('Elite');

  final String name;
  const SwimmerLevel(this.name);

  static SwimmerLevel fromSeconds(int totalSeconds) {
    if (totalSeconds < 70) {
      return SwimmerLevel.elite;
    } else if (totalSeconds < 90) {
      return SwimmerLevel.advanced;
    } else if (totalSeconds < 120) {
      return SwimmerLevel.intermediate;
    } else {
      return SwimmerLevel.beginner;
    }
  }
}
