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
      child: ListTile(
        title: Text(
          kitap.baslik,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Yazar: ${kitap.yazar}'),
            Text('Yayınevi: ${kitap.yayinevi}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_outline),
          onPressed: silmeIslemi,
          color: Colors.red,
        ),
      ),
    );
  }
}
//aaaaaaaaa
