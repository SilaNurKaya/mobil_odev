import 'package:flutter/material.dart';
import '../models/kitap.dart';

class KitapListeElemani extends StatelessWidget {
  final Kitap kitap;
  final VoidCallback silmeIslemi;

  const KitapListeElemani({
    Key? key,
    required this.kitap,
    required this.silmeIslemi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: InkWell(
        onTap: () {
          // Detayların gösterileceği bir dialog veya ekran açılır
          _kitapDetayGoster(context);
        },
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          title: Text(
            kitap.baslik,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(0, 0, 0, 0.867),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yazar: ${kitap.yazar}',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromRGBO(0, 0, 0, 0.867),
                ),
              ),
              Text(
                'Yayınevi: ${kitap.yayinevi}',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromRGBO(0, 0, 0, 0.867),
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: silmeIslemi,
            color: Colors.red,
            iconSize: 28,
          ),
        ),
      ),
    );
  }

  void _kitapDetayGoster(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            kitap.baslik,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Yazar: ${kitap.yazar}'),
              SizedBox(height: 8),
              Text('Yayınevi: ${kitap.yayinevi}'),
              if (kitap.yayinTarihi.isNotEmpty) ...[
                SizedBox(height: 8),
                Text('Yayın Tarihi: ${kitap.yayinTarihi}'),
              ],
              if (kitap.tur.isNotEmpty) ...[
                SizedBox(height: 8),
                Text('Tür: ${kitap.tur}'),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}
