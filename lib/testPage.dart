import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121214),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121214),
        title: const Text(
          'Обучение',
          style: TextStyle(
            color: Color(0xFFF2F2F3),
            fontSize: 20,
            fontFamily: 'Unbounded',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCategoryRow(),
            const SizedBox(height: 16),
            _buildSectionTitle('Новые уроки'),
            const SizedBox(height: 8),
            _buildHorizontalLessonCards(),
            const SizedBox(height: 16),
            _buildSectionTitle('Популярные уроки'),
            const SizedBox(height: 8),
            _buildHorizontalLessonCards(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildCategoryRow() {
    final categories = [
      {'title': 'Тренировки', 'lessons': '15 уроков'},
      {'title': 'БАДы', 'lessons': '8 уроков'},
      {'title': 'Питание', 'lessons': '12 уроков'},
      {'title': 'Все уроки', 'lessons': '35 уроков'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          return Container(
            width: 167,
            margin: const EdgeInsets.only(right: 9),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/167/102'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0x3DE27B00),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  cat['title']!,
                  style: const TextStyle(
                    color: Color(0xFFF2F2F3),
                    fontSize: 15,
                    fontFamily: 'Unbounded',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  cat['lessons']!,
                  style: const TextStyle(
                    color: Color(0xFF696576),
                    fontSize: 12,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFF2F2F3),
          fontSize: 13,
          fontFamily: 'Unbounded',
        ),
      ),
    );
  }

  Widget _buildHorizontalLessonCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(2, (_) => _buildLessonCard()).expand((w) => [w, const SizedBox(width: 8)]).toList(),
      ),
    );
  }

  Widget _buildLessonCard() {
    return Container(
      width: 264,
      decoration: BoxDecoration(
        color: const Color(0xFF242328),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 164,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage("https://picsum.photos/264/164"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE27B00),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.play_arrow, size: 24, color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Новое',
                  style: TextStyle(
                    color: Color(0xFFE27B00),
                    fontSize: 11,
                    fontFamily: 'Unbounded',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Полный гид по протеину',
                  style: TextStyle(
                    color: Color(0xFFF2F2F3),
                    fontSize: 13,
                    fontFamily: 'Unbounded',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Протеин — одна из самых популярных спортивных добавок...',
                  style: TextStyle(
                    color: Color(0xFF696576),
                    fontSize: 12,
                    fontFamily: 'Inter',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0A0C0F),
      selectedItemColor: const Color(0xFFE27B00),
      unselectedItemColor: const Color(0xFF696576),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Тренировки'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Дневник'),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Питание'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Обучение'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
      ],
      currentIndex: 3,
      onTap: (_) {},
    );
  }
}