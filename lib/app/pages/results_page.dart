import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String quartier;
  final String secteur;
  final String zone;

  const ResultsPage({
    Key? key,
    required this.quartier,
    required this.secteur,
    required this.zone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        centerTitle: true,
        title: Text(
          quartier,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Zone correspondante: $zone',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Horaires de coupure probable :',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: const [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('07H-13H')),
                DataColumn(label: Text('13H-18H')),
                DataColumn(label: Text('18H-07H')),
              ], rows: _getRows(zone)),
            ),
            const SizedBox(height: 16.0),
            Text("Scrollez de gauche à droite pour accéder aux horaires complets",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
              fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 36.0),
            const Text(
              'Ce sont les prévisions de la CEET. Nous ne garantissons en aucun cas le respect à la lettre de ces horaires. Veuillez donc prendre les dispositions nécessaires.',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  List<DataRow> _getRows(String zone) {
    final data = {
      "Zone 1": [
        ["19/05/2024", "Coupure", "Courant", "Courant"],
        ["20/05/2024", "Courant", "Coupure", "Courant"],
        ["21/05/2024", "Coupure", "Courant", "Courant"],
        ["22/05/2024", "Courant", "Coupure", "Courant"],
        ["23/05/2024", "Coupure", "Courant", "Courant"],
        ["24/05/2024", "Courant", "Coupure", "Courant"],
        ["25/05/2024", "Coupure", "Courant", "Courant"],
        ["26/05/2024", "Courant", "Coupure", "Coupure"],
      ],
      "Zone 2": [
        ["19/05/2024", "Courant", "Coupure", "Courant"],
        ["20/05/2024", "Coupure", "Courant", "Courant"],
        ["21/05/2024", "Courant", "Coupure", "Courant"],
        ["22/05/2024", "Coupure", "Courant", "Courant"],
        ["23/05/2024", "Courant", "Coupure", "Courant"],
        ["24/05/2024", "Coupure", "Courant", "Courant"],
        ["25/05/2024", "Courant", "Coupure", "Courant"],
        ["26/05/2024", "Coupure", "Courant", "Courant"],
      ],
      "Zone 3": [
        ["19/05/2024", "Courant", "Courant", "Coupure"],
        ["20/05/2024", "Courant", "Courant", "Coupure"],
        ["21/05/2024", "Courant", "Courant", "Coupure"],
        ["22/05/2024", "Courant", "Courant", "Coupure"],
        ["23/05/2024", "Courant", "Courant", "Coupure"],
        ["24/05/2024", "Courant", "Courant", "Coupure"],
        ["25/05/2024", "Courant", "Courant", "Coupure"],
        ["26/05/2024", "Courant", "Courant", "Coupure"],
      ],
    };

    final filteredData = data[zone]!
        .where((row) => row.sublist(1).contains("Coupure"))
        .toList();

    return filteredData.map((row) {
      return DataRow(cells: row.map((cell) => DataCell(Text(cell))).toList());
    }).toList();
  }
}
