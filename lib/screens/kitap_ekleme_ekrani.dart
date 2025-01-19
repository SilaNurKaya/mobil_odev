import 'package:flutter/material.dart';
import 'package:odev/helpers/database.dart';
import '../models/kitap.dart';
import '../widgets/kitap_form_alani.dart';

class KitapEklemeEkrani extends StatefulWidget {
  const KitapEklemeEkrani({super.key});

  @override
  _KitapEklemeEkraniState createState() => _KitapEklemeEkraniState();
}

class _KitapEklemeEkraniState extends State<KitapEklemeEkrani> {
  final _formAnahtari = GlobalKey<FormState>();
  final _baslikKontrol = TextEditingController();
  final _yazarKontrol = TextEditingController();
  final _yayineviKontrol = TextEditingController();
  final _yayinTarihiKontrol = TextEditingController();
  final _turKontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yeni Kitap Ekle',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 153, 226, 241),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formAnahtari,
          child: Column(
            children: [
              KitapFormAlani(
                label: 'Kitap Adı',
                controller: _baslikKontrol,
              ),
              KitapFormAlani(
                label: 'Yazar',
                controller: _yazarKontrol,
              ),
              KitapFormAlani(
                label: 'Yayınevi',
                controller: _yayineviKontrol,
              ),
              KitapFormAlani(
                label: 'Basım Tarihi',
                controller: _yayinTarihiKontrol,
              ),
              KitapFormAlani(
                label: 'Tür',
                controller: _turKontrol,
              ),
              SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _kitabiKaydet,
                icon: Icon(Icons.save, size: 20),
                label: Text(
                  'Kaydet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 255, 255, 255), // Buton rengi
                  foregroundColor:
                      const Color.fromARGB(255, 183, 156, 229), // Yazı rengi
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _kitabiKaydet() async {
    if (_formAnahtari.currentState!.validate()) {
      final kitap = Kitap(
        baslik: _baslikKontrol.text,
        yazar: _yazarKontrol.text,
        yayinevi: _yayineviKontrol.text,
        yayinTarihi: _yayinTarihiKontrol.text,
        tur: _turKontrol.text,
      );
      await Veritabani.instance.kitapEkle(kitap);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _baslikKontrol.dispose();
    _yazarKontrol.dispose();
    _yayineviKontrol.dispose();
    _yayinTarihiKontrol.dispose();
    _turKontrol.dispose();
    super.dispose();
  }
}
