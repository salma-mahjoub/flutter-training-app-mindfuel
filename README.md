# MindFuel – Habit Inspiration App (Flutter)

A minimalist, read‑only Flutter app that showcases bite‑size wellness habits with a clean UI, a detail view, and a simple Favorites system. Built in **3 days (July 28–30)** during an Orange Digital Center workshop.

---

## ✨ Highlights

* 📚 **Read‑only content** from a local JSON file (no backend required)
* 🗂️ **Home list → Detail page** navigation
* ⭐ **Favorites**: like items and see them in a dedicated tab
* 🖼️ **Local assets** for images (fast, offline‑friendly)
* 🎯 **Clean architecture**: models, services, widgets, pages
* 📱 Built with **Flutter (cross‑platform)**; tested on Android

---

## 🧱 Architecture

```
lib/
├─ main.dart
├─ models/
│  └─ habit.dart
├─ services/
│  └─ habit_service.dart
├─ pages/
│  ├─ home_page.dart
│  ├─ detail_page.dart
│  └─ profile_page.dart
├─ widgets/
│  └─ habit_card.dart
└─ providers/
   └─ favorites_provider.dart
assets/
├─ data/habits.json
└─ images/
   ├─ water.jpg
   ├─ breathe.jpg
   ├─ grounding.jpg
   └─ journal.jpg
```

---

## 🛠️ Tech Stack

* **Flutter** 3.x
* **Dart**
* **provider** (state management for Favorites)

Add to `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1

flutter:
  assets:
    - assets/data/habits.json
    - assets/images/
```

---

## 📦 Data (local JSON)

`assets/data/habits.json` example:

```json
[
  {
    "title": "Drink a glass of water upon waking",
    "category": "Health",
    "duration": "1 min",
    "impact": "high",
    "description": "This habit helps to reactivate the body, hydrate it, and improve digestion first thing in the morning.",
    "tip": "Always keep a glass ready on your nightstand.",
    "image": "assets/images/water.jpg"
  },
  {
    "title": "Take 3 deep breaths",
    "category": "Mental",
    "duration": "2 min",
    "impact": "medium",
    "description": "Conscious breathing calms the nervous system and reduces stress.",
    "tip": "Do it before a meeting or a class.",
    "image": "assets/images/breathe.jpg"
  },
  {
    "title": "Stand barefoot on grass",
    "category": "Wellness",
    "duration": "3 min",
    "impact": "high",
    "description": "Grounding helps reconnect with nature, reduce inflammation, and improve sleep quality.",
    "tip": "Try it in the morning while having your tea or coffee.",
    "image": "assets/images/grounding.jpg"
  },
  {
    "title": "Write a one-sentence journal entry",
    "category": "Personal Growth",
    "duration": "2 min",
    "impact": "medium",
    "description": "Capturing a thought, feeling, or moment each day strengthens self-awareness and memory.",
    "tip": "Use a dedicated notebook or note app.",
    "image": "assets/images/journal.jpg"
  }
]
```

---

## ▶️ Getting Started

1. **Clone** the project and open in your IDE (Android Studio / IntelliJ / VS Code).
2. Ensure Flutter SDK is installed and an Android device/emulator is running.
3. Run:

   ```bash
   flutter pub get
   flutter run
   ```

If you add/rename assets, do a **full restart** (not hot reload).

---

## 🧭 Navigation

* `HomePage` → list of habits (cards)
* Tap a card → `HabitDetailPage`
* BottomNavigationBar tabs: **Habits**, **Favorites**, **Profile**

---

## 🎨 Theming & UI

* Palette around **Deep Purple** (Material 3 ready)
* Rounded cards, subtle shadows, readable typography
* Detail page with icons (duration, impact, tip)

---

## 🔧 Configuration Tips

* Check paths and names: asset paths are **case‑sensitive**.
* Declare assets in `pubspec.yaml` with proper indentation.
* Use `Image.asset('assets/images/your_image.jpg')` and include a fallback `errorBuilder` in debug.

---

## 🗺️ Roadmap

* [ ] Persist favorites locally (e.g., `shared_preferences`)
* [ ] Search & category filters
* [ ] Dark mode
* [ ] iOS build & Web/desktop exploration
* [ ] Accessibility & localization (EN/FR)

---

## 🤝 Acknowledgments

* Orange Digital Center workshop
* Mentored by **Madame Manel Kacem**

---

## 📫 Contact

* **Author:** Salma Mahjoub
* **Location:** Tunis, Tunisia
* **Email:** [mahjoub2003@gmail.com](mailto:mahjoub2003@gmail.com)

---

## 📄 License

Personal/educational project. You may adapt for learning purposes.
