import 'package:ceet_project/app/pages/results_page.dart';
import 'package:flutter/material.dart';

import '../data/zones.dart';
import '../widgets/location_card.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _filteredQuartiers = [];

  void _filterQuartiers(String input) {
    final query = input.toLowerCase();
    final List<Map<String, String>> results = [];
    for (var zone in zones) {
      for (var secteur in zone['secteurs']) {
        for (var quartier in secteur['quartiers']) {
          if (quartier.toLowerCase().contains(query)) {
            results.add({
              'quartier': quartier,
              'secteur': secteur['nom'],
              'zone': zone['zone']
            });
          }
        }
      }
    }

    setState(() {
      _filteredQuartiers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Center(
          child: Text(
            'Le courant tu l\'as?',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("Veuillez saisir la localité pour accéder aux prévisions de coupure",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
            textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Entrez votre quartier',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    setState(() {
                      _filteredQuartiers.clear();
                    });
                  },
                ),
              ),
              onChanged: _filterQuartiers,
            ),
            SizedBox(height: 20,),
            Expanded(
              child: _filteredQuartiers.isEmpty
                  ? const Center(child: Text('Aucune correspondance trouvée'))
                  : ListView.builder(
                itemCount: _filteredQuartiers.length,
                itemBuilder: (context, index) {
                  final quartier = _filteredQuartiers[index];
                  return LocationCard(
                    quartier: quartier['quartier']!,
                    secteur: quartier['secteur']!,
                    zone: quartier['zone']!,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPage(
                            quartier: quartier['quartier']!,
                            secteur: quartier['secteur']!,
                            zone: quartier['zone']!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
