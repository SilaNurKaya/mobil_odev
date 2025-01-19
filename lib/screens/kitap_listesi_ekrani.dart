import 'package:flutter/material.dart';
import 'package:odev/widgets/kitap_liste_elemani.dart';
import '../models/kitap.dart';
import '../helpers/database.dart';
import 'kitap_ekleme_ekrani.dart';

class KitapListesiEkrani extends StatefulWidget {
  @override
  _KitapListesiEkraniState createState() => _KitapListesiEkraniState();
}

class _KitapListesiEkraniState extends State<KitapListesiEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitap Arşivi'),
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
                style: Theme.of(context).textTheme.titleMedium,
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
        label: Text('Kitap Ekle'),
      ),
    );
  }
}
