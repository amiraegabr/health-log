import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final List<String> _notes = [];
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_notes[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _noteController,
              decoration: const InputDecoration(hintText: 'Enter a note'),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _notes.add(_noteController.text);
                _noteController.clear();
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
