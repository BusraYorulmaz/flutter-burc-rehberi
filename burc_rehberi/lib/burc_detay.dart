import 'package:burc_rehberi/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;//renk olmasın-> transparant
  late PaletteGenerator _generator;

  @override
  void initState() {
    //ilk çalıştırmada bir kez çalışıyor
    //değişkenlerin ilk atamaları yapılırken kullanılabilir.
    super.initState();
    
    print('init state çalıştı');
//bu kısım önce build edilen kısım çalışsın ve bitsin bittikten sonra işlemler yapılıp setstate edip işlemler yapılır
    WidgetsBinding.instance.addPostFrameCallback((_)=>  appbarRenginiBul());
    //_generator =PaletteGenerator.fromImage(AssetImage(assetName));
  }

  @override
  Widget build(BuildContext context) {
    print('build çalıştı');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250, //uygulama açıldığında ne kadar yer tutacağı
            pinned: true, //sabit kalsın yukarı aşşağı kaydırdığımızda
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                  child: Text(
                widget.secilenBurc.burcDetayi,
                style: Theme.of(context).textTheme.subtitle1,
              )),
            ),
          ),
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    print('build bitti baskın renk bulunacak');
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.secilenBurc.burcBuyukResim}'));
        appbarRengi =_generator.dominantColor!.color;
    print(' baskın renk bulundu build metodu tekrar çalıştırılacak');

        setState(() {
          
        });
        print(appbarRengi);
  }
}
