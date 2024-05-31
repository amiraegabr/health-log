import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final List<String> _notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _notes.isEmpty ? _buildEmptyNotesView() : _buildNotesList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote();
        },
        backgroundColor: Colors.blueGrey[900],
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyNotesView() {
    return Center(
      child: Text(
        "NO NOTES YET",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildNotesList() {
    return ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          color: Colors.white,
          child: ListTile(
            title: Text(
              _notes[index],
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        );
      },
    );
  }

  void _addNote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String noteText = '';

        return AlertDialog(
          title: const Text("Add Note"),
          backgroundColor: Colors.grey[200],
          content: TextField(
            onChanged: (value) {
              noteText = value;
            },
            decoration: InputDecoration(
              hintText: "Enter your note",
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "CANCEL",
                style: TextStyle(
                  color: Colors.blueGrey[900],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (noteText.isNotEmpty) {
                  setState(() {
                    _notes.add(noteText);
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text(
                "ADD",
                style: TextStyle(
                  color: Colors.blueGrey[900],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}