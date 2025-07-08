import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DashboardPage extends StatelessWidget {
  final String firstName;
  const DashboardPage({super.key, required this.firstName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0C29),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Branding
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.cyan],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.school,
                          color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.purple, Colors.cyan],
                          ).createShader(bounds),
                          child: const Text(
                            'EduGlow',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text(
                          'Learning Dashboard',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                // Right Controls
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none),
                      color: Colors.grey[300],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                      color: Colors.grey[300],
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text('Adarsh Kumar',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        Text('student@eduglow.com',
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                            colors: [Colors.purple, Colors.cyan]),
                      ),
                      child: const Icon(Icons.person,
                          color: Colors.white, size: 16),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ],
            ).animate().slideY(duration: 600.ms),

            const SizedBox(height: 32),

            // Welcome
            Center(
              child: Column(
                children: const [
                  Text('Welcome back, Adarsh! 👋',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 8),
                  Text('Ready to continue your learning journey?',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ).animate().fadeIn(duration: 600.ms),
            ),

            const SizedBox(height: 32),

            // Stats Grid
            Wrap(
              spacing: 54,
              runSpacing: 30,
              children: [
                _buildStatCard('Total Courses', '6', 'Active enrollments',
                    Icons.menu_book, Colors.purple),
                _buildStatCard('Completed', '2 +12%', 'Courses finished',
                    Icons.emoji_events, Colors.green),
                _buildStatCard('Avg Progress', '59% +8%', 'Across all courses',
                    Icons.show_chart, Colors.cyan),
                _buildStatCard('Learning Hours', '47 +15%', 'This month',
                    Icons.access_time, Colors.pink),
                _buildStatCard(
                    'Streaks',
                    '7',
                    'This month',
                    Icons.local_fire_department,
                    const Color.fromARGB(255, 33, 129, 1)),
              ],
            ).animate().fadeIn(duration: 600.ms, delay: 200.ms),

            const SizedBox(height: 38),

            // Courses Section (Sample)
            const Text('My Courses (4)',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 52,
              runSpacing: 24,
              children: [
                _buildCourseCard(
                  title: 'Advanced React Development',
                  instructor: 'Sarah Chen',
                  description:
                      'Master React concepts with performance and modern patterns and interative learing.',
                  progress: 85,
                  category: 'Frontend',
                  duration: '8 weeks',
                  rating: 4.8,
                  color: Colors.purple,
                  imageUrl:
                      'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=420&h=200&fit=crop',
                ),
                _buildCourseCard(
                  title: 'Machine Learning Fundamentals',
                  instructor: 'Dr. Michael Rodriguez',
                  description:
                      'Introduction to ML algorithms and model evaluation.',
                  progress: 62,
                  category: 'Data Science',
                  duration: '12 weeks',
                  rating: 4.9,
                  color: Colors.cyan,
                  imageUrl:
                      'https://plus.unsplash.com/premium_photo-1676637656166-cb7b3a43b81a?w=420&h=200&fit=crop',
                ),
                _buildCourseCard(
                  title: 'Flutter learning',
                  instructor: 'Dr. Rahul Gupta',
                  description:
                      'Learn to create responsive UIs and leverage Dart for cross-platform development.',
                  progress: 62,
                  category: 'Devlopment',
                  duration: '12 weeks',
                  rating: 4.9,
                  color: const Color.fromARGB(255, 212, 152, 0),
                  imageUrl:
                      'https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?w=420&h=200&fit=crop',
                ),
                _buildCourseCard(
                  title: 'Software Learing',
                  instructor: 'Dr. Mohit Gupta',
                  description:
                      'A complete walkthough software journey with learing about models and its implementations.',
                  progress: 30,
                  category: 'Devlopment',
                  duration: '12 weeks',
                  rating: 4.9,
                  color: const Color.fromARGB(255, 212, 2, 128),
                  imageUrl:
                      'https://images.unsplash.com/photo-1571171637578-41bc2dd41cd2?w=600&h=200&fit=crop',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle,
      IconData icon, Color iconColor) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 6),
              Text(value,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          )
        ],
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String instructor,
    required String description,
    required int progress,
    required String category,
    required String duration,
    required double rating,
    required Color color,
    required String imageUrl,
  }) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(imageUrl,
                height: 160, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 4),
                Text(instructor,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 8),
                Text(description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.book, size: 12, color: Colors.grey[400]),
                    const SizedBox(width: 4),
                    const Text("20/24 lessons",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 16),
                    Icon(Icons.access_time, size: 12, color: Colors.grey[400]),
                    const SizedBox(width: 4),
                    Text(duration,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Progress",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text("$progress%",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white)),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.cyan]),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
