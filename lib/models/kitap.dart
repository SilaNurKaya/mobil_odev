class Kitap {
  final int? id;
  final String baslik;
  final String yazar;
  final String yayinevi;
  final String yayinTarihi;
  final String tur;

  Kitap({
    this.id,
    required this.baslik,
    required this.yazar,
    required this.yayinevi,
    required this.yayinTarihi,
    required this.tur,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'baslik': baslik,
      'yazar': yazar,
      'yayinevi': yayinevi,
      'yayinTarihi': yayinTarihi,
      'tur': tur,
    };
  }

  factory Kitap.fromMap(Map<String, dynamic> map) {
    return Kitap(
      id: map['id'],
      baslik: map['baslik'],
      yazar: map['yazar'],
      yayinevi: map['yayinevi'],
      yayinTarihi: map['yayinTarihi'],
      tur: map['tur'],
    );
  }
}
