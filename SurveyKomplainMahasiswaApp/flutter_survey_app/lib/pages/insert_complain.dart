import 'package:flutter/material.dart';

class AddDataDialog extends StatefulWidget {
  const AddDataDialog({Key? key}) : super(key: key);

  @override
  State<AddDataDialog> createState() => _AddDataDialogState();
}

class _AddDataDialogState extends State<AddDataDialog> {
  // final TextEditingController _genreController = TextEditingController();
  final TextEditingController _reportsController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _gpaController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  // final TextEditingController _genderController = TextEditingController();
  // final TextEditingController _nationalityController = TextEditingController();

  final List<String> genres = ['Academic Support and Resources', 'Athletics and sports', 'Career opportunities', 'Financial Support', 'Health and Well-being Support', 'Online learning', 'Student Affairs', 'Food and Cantines', 'International student experiences', 'Housing and Transportation', 'Activities and Travelling'];
  String selectedGenre = 'Academic Support and Resources';

  final List<String> genders = ['M', 'F'];
  String selectedGender = 'M';

  final List<String> nationalities = ['Indonesia', 'Soudan', 'France', 'Mexico', 'South Africa', 'Yemen'];
  String selectedNationality = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.insert_comment, color: Colors.black),
          SizedBox(width: 5.0,),
          Text('Insert Complain'),
        ],
      ),
      content: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputDecorator(
              decoration: InputDecoration(
                labelText: 'Genre',
              ),
              child: Flexible(
                child: DropdownButton<String>(
                  value: selectedGenre,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGenre = newValue!;
                    });
                  },
                  items: genres.map((genre) {
                    return DropdownMenuItem<String>(
                      value: genre,
                      child: Text(genre, style: TextStyle(fontSize: 12.0)),
                      
                    );
                  }).toList(),
                ),
              ),
            ),
            TextFormField(
              controller: _reportsController,
              decoration: InputDecoration(
                labelText: 'Report',
              ),
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
            ),
            TextFormField(
              controller: _gpaController,
              decoration: InputDecoration(
                labelText: 'GPA',
              ),
            ),
            TextFormField(
              controller: _yearController,
              decoration: InputDecoration(
                labelText: 'Year',
              ),
            ),
            InputDecorator(
              decoration: InputDecoration(
                labelText: 'Gender',
                ),
                child: DropdownButton<String>(
                  value: selectedGender,
                  onChanged: (newValue) {
                    setState(() {
                      selectedGender = newValue!;
                      },);
                      },
                      items: genders.map((gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender, style: TextStyle(fontSize: 12.0)),
                          );
                          }).toList(),
                          ),
                          ),
            InputDecorator(
              decoration: InputDecoration(
                labelText: 'Nationality',
                ),
                child: DropdownButton<String>(
                  value: selectedNationality,
                  onChanged: (newValue) {
                    setState(() {
                      selectedNationality = newValue!;
                      });
                      },
                      items: nationalities.map((nationality) {
                        return DropdownMenuItem<String>(
                          value: nationality,
                          child: Text(nationality, style: TextStyle(fontSize: 12.0)),
                          );
                          }).toList(),
                          ),
                          ),
                          ],
        ),
      ),
      // actions: [
      //   ElevatedButton(
      //     onPressed: () {
      //       // Simpan data
      //     },
      //     child: Text('Simpan'),
      //   ),
      //   TextButton(
      //     onPressed: () {
      //       // Batalkan
      //     },
      //     child: Text('Batal'),
      //   ),
      // ],
      )
    );
   }
}
