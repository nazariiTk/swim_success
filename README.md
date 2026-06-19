# Swim Success Flutter Test Task

A professional Flutter implementation of the Swim Success test task consisting of two main features: **Pace Selector** and **User Directory**.

---

## Features & Requirements

### 1. Pace Selector (Task 1)
- **Interactive Pace Input**: Two large displays for minutes and seconds with up/down arrows and tap-to-edit capabilities (with active digits filters and `0–59` seconds validation).
- **Custom Segmented Slider**: A custom segmented track dividing the pace into four swimmer levels. The slider is thinner (`3.0` height) with soft rounded segment borders.
- **Custom Glowing Selector (Thumb)**: Built using `GlowingSliderThumbShape` extending `SliderComponentShape` to draw a custom thumb that animates and glows dynamically based on the active level color.
- **Glow Button Shadow**: The Continue button has a dynamic matching color-coded shadow (`BoxShadow` with blur radius of `16.0` and offset of `6.0`) that behaves like a neon glow of the swimmer's level.
- **Clean Architecture API Integration**: Sends a `POST` request to `https://jsonplaceholder.typicode.com/posts` containing `{"pace_seconds": totalSeconds}` on tapping Continue. Displays dynamic contrast loading states and handles success and error alerts gracefully.
- **Swimmer Level Time Ranges**:
  - **Elite**: `< 70s` (Range: 45s – 69s)
  - **Advanced**: `70s – 89s` (Range: 70s – 89s)
  - **Intermediate**: `90s – 119s` (Range: 90s – 119s)
  - **Beginner**: `>= 120s` (Range: 120s – 240s)

### 2. User Directory (Task 2)
- **User List Page**: Fetches data from `GET https://jsonplaceholder.typicode.com/users`. Renders Name, Email, and Phone number in styled custom Cards.
- **Search Filtering**: Debounced search input (using a custom `Debouncer` class) allowing filtering of users by name dynamically.
- **Pull-To-Refresh**: Integrates `RefreshIndicator` enabling pull-to-refresh to fetch updated data.
- **User Detail Page**: Tapping a card navigates to a details screen demonstrating additional data structure (address, company details, website).

---

## Architecture & Code Cleanliness

The project utilizes **Clean Architecture** combined with BLoC state management to ensure solid separation of concerns and testability:

```
lib/
├── core/
│   ├── di/                  # Dependency Injection (GetIt Container)
│   ├── error/               # Exception handling models
│   ├── network/             # ApiConstants and endpoints configuration
│   ├── theme/               # Global Light and Dark theme configs
│   └── utils/               # Common utilities (Debouncer, String extensions)
└── features/
    ├── pace_selector/       # Feature 1: Pace Selector Screen
    │   ├── data/            # Data Sources, Repositories implementations
    │   ├── domain/          # Entities, Repository definitions, Use Cases
    │   └── presentation/    # Page/View layout and modular UI Widgets
    └── users/               # Feature 2: User List and Detail Screen
        ├── data/            # Models parsing JSON, Remote Data Sources
        ├── domain/          # Use Cases, Entities
        └── presentation/    # Page, View, List Card Widgets
```

### Decoupling & God Object Mitigation
To avoid the "God Object" anti-pattern in the presentation layer:
- The page files (e.g. `PaceSelectorPage`) are pure `StatelessWidget`s responsible solely for DI instantiation via `BlocProvider`.
- Visual components, layout structures, and animated controllers are isolated into modular files under the `widgets/` folder (such as `PaceSelectorTimer`, `SwimmerLevelIndicator`, and `SwimmerLevelsRow`).
- Local animations (using `TweenAnimationBuilder` or `AnimatedSwitcher`) live directly within the widgets they animate, optimizing performance by localizing widget rebuilds (`buildWhen` filters).

---

## State Management Choice: BLoC / Cubit

### Why Cubit?
We selected **Cubit** (from `flutter_bloc`) as the state management solution for this project:
- **Separation of Concerns**: It cleanly splits business logic, network requests, and input mutations from UI build rendering.
- **Boilerplate Reduction**: Unlike full BLoC which requires declaring separate classes for every event, Cubit allows calling standard methods directly. This is much faster and cleaner for screens with straightforward user flows while maintaining the same robust state-stream architecture.
- **Reactive UI**: Pairs perfectly with `BlocBuilder` and `BlocListener` to handle reactive UI updates (like sliding updating displays, error snackbars, and loading states).

---

## What I Would Do Differently With More Time
1. **Automated Unit & UI Tests**:
   - Write comprehensive unit tests for `PaceCubit` and `UsersCubit` mocking repository behaviors using `mocktail` or `mockito`.
   - Write widget tests for custom widgets (like `GlowingSliderThumbShape` and `SliderLabels`).
2. **Local Persistence**:
   - Implement local caching using `hydrated_bloc` or `shared_preferences` to persist the selected pace and swimmer level category across application restarts.
3. **Enhanced Navigation**:
   - Pass user entities via router path parameters rather than object arguments, which makes deep-linking and state restoration easier.
