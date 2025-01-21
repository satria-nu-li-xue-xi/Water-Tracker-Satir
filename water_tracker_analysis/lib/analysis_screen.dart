import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('For Today'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          itemCount: 5,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return _buildCard('Water', '2.1 Liters', Icons.local_drink, 10.0);
              case 1:
                return _buildCard('Walk', '2628 Steps Completed', Icons.directions_walk, 10.0);
              case 2:
                return _buildCard('Calories', '510.43 Kcal', Icons.local_fire_department, 10.0);
              case 3:
                return _buildCard('Heart', '105 bpm', Icons.favorite, 10.0);
              case 4:
                return _buildCard('Sleep', '08:00 hours', Icons.bedtime, 10.0);
              default:
                return Container();
            }
          },
          staggeredTileBuilder: (index) {
            switch (index) {
              case 0:
              case 1:
                return StaggeredTile.extent(2, 240); // Dua grid pertama dengan ukuran yang sama
              case 2:
                return StaggeredTile.extent(2, 200); 
              case 3:
                return StaggeredTile.extent(2, 416); 
              case 4:
                return StaggeredTile.extent(2, 200); 
              default:
                return StaggeredTile.extent(2, 150);
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.alarm),
            ),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String value, IconData icon, double size) {
    return Card(
      color: Colors.grey.shade50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40.0),
          SizedBox(height: size),
          Text(
            title,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size),
          Text(
            value,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
