import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/kitap.dart';

class Veritabani {
  static final Veritabani instance = Veritabani._init();
  static Database? _veritabani;

  Veritabani._init();

  Future<Database> get veritabani async {
    if (_veritabani != null) return _veritabani!;
    _veritabani = await _veritabaniBaslat('kitaplar.db');
    return _veritabani!;
  }

  Future<Database> _veritabaniBaslat(String dosyaYolu) async {
    final dbYolu = await getDatabasesPath();
    final tamYol = join(dbYolu, dosyaYolu);

    return await openDatabase(
      tamYol,
      version: 1,
      onCreate: _veritabaniOlustur,
    );
  }

  Future<void> _veritabaniOlustur(Database db, int version) async {
    await db.execute('''
      CREATE TABLE kitaplar(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        baslik TEXT NOT NULL,
        yazar TEXT NOT NULL,
        yayinevi TEXT NOT NULL,
        yayinTarihi TEXT NOT NULL,
        tur TEXT NOT NULL
      )
    ''');
  }

  Future<int> kitapEkle(Kitap kitap) async {
    final db = await veritabani;
    return await db.insert(
      'kitaplar',
      kitap.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Kitap>> tumKitaplariGetir() async {
    final db = await veritabani;
    final List<Map<String, dynamic>> maps = await db.query('kitaplar');
    return List.generate(maps.length, (i) => Kitap.fromMap(maps[i]));
  }

  Future<int> kitapGuncelle(Kitap kitap) async {
    final db = await veritabani;
    return await db.update(
      'kitaplar',
      kitap.toMap(),
      where: 'id = ?',
      whereArgs: [kitap.id],
    );
  }

  Future<int> kitapSil(int id) async {
    final db = await veritabani;
    return await db.delete(
      'kitaplar',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
