import 'package:flutter/material.dart';
import '../models/habit.dart';
import '../services/habit_service.dart';
import '../widgets/habit_card.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Habit>> _habits;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _habits = HabitService().loadHabits();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      habitsListView(),
      Center(child: Text('No elements in Favorites')),
      const ProfilePage(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F5FF), // Fond légèrement violacé très clair
      appBar: AppBar(
        title: const Text(
          "MindFuel",
          style: TextStyle(
            fontWeight: FontWeight.w600, // Plus léger que "bold"
            fontSize: 22, // Taille réduite
            letterSpacing: 1.2,
            color: Color(0xFF5E4B8B), // Violet foncé subtil (taupe violacé)
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFC6B1FF), // Violet très clair
        elevation: 0,
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Color(0xFF5E4B8B)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, -4)),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: const Color(0xFF7B6AB8), // Violet moyen doux
            unselectedItemColor: Colors.grey.shade500,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_rounded,
                    size: 24,
                    color: _currentIndex == 0
                        ? const Color(0xFF7B6AB8)
                        : Colors.grey.shade500),
                label: 'Habits',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded,
                    size: 24,
                    color: _currentIndex == 1
                        ? const Color(0xFF7B6AB8)
                        : Colors.grey.shade500),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded,
                    size: 24,
                    color: _currentIndex == 2
                        ? const Color(0xFF7B6AB8)
                        : Colors.grey.shade500),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget habitsListView() {
    return FutureBuilder<List<Habit>>(
      future: _habits,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color(0xFF7B6AB8)),
                ),
                const SizedBox(height: 16),
                Text(
                  'Chargement...',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14, // Texte plus discret
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,
                    size: 44,
                    color: Colors.grey.shade400),
                const SizedBox(height: 12),
                Text(
                  'Une erreur est survenue',
                  style: TextStyle(
                    color: const Color(0xFF5E4B8B),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inbox_outlined,
                    size: 44,
                    color: Colors.grey.shade400),
                const SizedBox(height: 12),
                Text(
                  'Aucune habitude trouvée',
                  style: TextStyle(
                    color: const Color(0xFF5E4B8B),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }

        final habits = snapshot.data!;
        return ListView.separated(
          itemCount: habits.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return HabitCard(habit: habits[index]);
          },
        );
      },
    );
  }
}