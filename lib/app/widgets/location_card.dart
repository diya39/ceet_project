import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String quartier;
  final String secteur;
  final String zone;
  final VoidCallback onPressed;

  const LocationCard({
    Key? key,
    required this.quartier,
    required this.secteur,
    required this.zone,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
        title: Text(quartier),
        subtitle: Text('$secteur, $zone'),
        trailing: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black), // Bordure rouge
            backgroundColor: Colors.red.shade100, // Fond blanc
          ),
          child: Text(
            'Afficher plus',
            style: TextStyle(color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold), // Texte rouge
          ),
        ),
      ),
    );
  }
}