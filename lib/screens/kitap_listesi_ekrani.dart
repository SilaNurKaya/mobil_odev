import 'package:flutter/material.dart';
import 'package:odev/widgets/kitap_liste_elemani.dart';
import '../models/kitap.dart';
import '../helpers/database.dart';
import 'kitap_ekleme_ekrani.dart';

class KitapListesiEkrani extends StatefulWidget {
  const KitapListesiEkrani({super.key});

  @override
  _KitapListesiEkraniState createState() => _KitapListesiEkraniState();
}

class _KitapListesiEkraniState extends State<KitapListesiEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kitap Arşivi',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(145, 102, 201, 216),
      ),
      body: FutureBuilder<List<Kitap>>(
        future: Veritabani.instance.tumKitaplariGetir(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'Henüz kitap eklenmemiş',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final book = snapshot.data![index];
              return KitapListeElemani(
                kitap: book,
                silmeIslemi: () async {
                  await Veritabani.instance.kitapSil(book.id!);
                  setState(() {});
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KitapEklemeEkrani()),
          ).then((_) => setState(() {}));
        },
        icon: Icon(Icons.add),
        label: Text(
          'Kitap Ekle',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(255, 183, 156, 229),
      ),
    );
  }
}
