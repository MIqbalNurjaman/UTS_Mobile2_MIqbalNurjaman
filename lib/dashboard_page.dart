import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final String username;

  DashboardPage({required this.username});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _artists = [
    {
      'name': 'Jennie',
      'songs': ['SOLO', 'You & Me', 'One Of The Girls', 'Mantra'],
    },
    {
      'name': 'Lisa',
      'songs': ['LALISA', 'MONEY', 'SG', 'Rockstart'],
    },
    {
      'name': 'Rosé',
      'songs': ['On The Ground', 'GONE', 'APT'],
    },
    {
      'name': 'Jisoo',
      'songs': ['Flower'],
    },
    {
      'name': 'Blackpink',
      'songs': [
        'How You Like That',
        'Kiss and Makeup',
        'DDU-DU DDU-DU',
        'Kill This Love',
        'Pink Venom',
        'As If It\'s Your Last',
        'Boombayah',
        'Lovesick Girls',
        'Stay',
      ],
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
        title: Text('List Song Artist'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black, // Pure black background
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _selectedIndex == 0
              ? _buildHomeTab()
              : _selectedIndex == 1
                  ? _buildMusicTab()
                  : _selectedIndex == 2
                      ? _buildArtistTab()
                      : _selectedIndex == 3
                          ? _buildSettingsTab()
                          : Container(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.pink,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note, size: 30),
            label: 'Music',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Artist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: _artists.length,
      itemBuilder: (context, index) {
        final artist = _artists[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArtistSongsPage(
                  artist: artist,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(
                artist['name'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMusicTab() {
    List<String> allSongs = [];
    for (var artist in _artists) {
      for (var song in artist['songs']) {
        allSongs.add('$song - ${artist['name']}'); // Format sesuai permintaan
      }
    }

    return Container(
      color: Colors.black, // Latar belakang halaman hitam
      child: ListView.builder(
        itemCount: allSongs.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.pink.shade100, // Latar belakang item
            margin: EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              title: Text(
                allSongs[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Teks warna hitam
                ),
              ),
              onTap: () {
                print('Lagu dipilih: ${allSongs[index]}');
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildArtistTab() {
    final List<String> members = [
      'Jennie',
      'Lisa',
      'Rosé',
      'Jisoo',
      'Blackpink',
    ];

    return Container(
      color: Colors.black, // Latar belakang halaman hitam
      child: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.pink.shade100, // Latar belakang item
            margin: EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              title: Text(
                members[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Teks warna hitam
                ),
              ),
              onTap: () {
                print('Anggota dipilih: ${members[index]}');
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingsTab() {
    return GridView.count(
      padding: EdgeInsets.all(16.0),
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 40, color: Colors.black),
                SizedBox(height: 8),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.exit_to_app, size: 40, color: Colors.black),
                SizedBox(height: 8),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ArtistSongsPage extends StatelessWidget {
  final Map<String, dynamic> artist;

  ArtistSongsPage({required this.artist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${artist['name']} Songs'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.black, // Latar belakang halaman hitam
        child: ListView.builder(
          itemCount: artist['songs'].length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.pink.shade100, // Latar belakang item
              margin: EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                title: Text(
                  '${artist['songs'][index]} - ${artist['name']}',
                  style: TextStyle(color: Colors.black), // Font warna hitam
                ),
                onTap: () {
                  print('Lagu dipilih: ${artist['songs'][index]}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
