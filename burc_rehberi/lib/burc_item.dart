import 'package:burc_rehberi/burc_detay.dart';
import 'package:flutter/material.dart';

import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme; //varsayılan text style
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4, //kartın gölgeliği
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
             Navigator.pushNamed(context, '/burcDetay',arguments: listelenenBurc);
            },

            //leading en baştaki resim
            leading: Image.asset("images/" + listelenenBurc.burcKucukResim),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStyle.headline5,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextStyle.subtitle1,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}
