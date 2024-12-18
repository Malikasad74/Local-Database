import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note_model.dart';

class DatabaseHelper {
  static const String _dbName = 'Notes.db';

  // Get the database instance
  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        // Create the "Note" table
        return db.execute(
          'CREATE TABLE Note(id INTEGER PRIMARY KEY, title TEXT, description TEXT)',
        );
      },
      version: 1,
    );
  }

  // Add a new note to the database
  static Future<int> addNote(Note note) async {
    final db = await _getDB();
    return await db.insert("Note", note.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Update an existing note in the database
  static Future<int> updateNote(Note note) async {
    final db = await _getDB();
    return await db
        .update("Note", note.toJson(), where: 'id = ?', whereArgs: [note.id]);
  }

  // Delete a note from the database
  static Future<int> deleteNote(Note note) async {
    final db = await _getDB();
    return await db.delete(
      "Note",
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Retrieve all notes from the database
  static Future<List<Note>> getAllNotes() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Note");

    if (maps.isEmpty) {
      return [];
    }

    return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
  }
}
