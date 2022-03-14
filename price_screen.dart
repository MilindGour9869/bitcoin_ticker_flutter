import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';



class PriceScreen extends StatefulWidget {


  final a=b.getdatacoin(btc,s1);
  final c=b.getdatacoin(etc,s1);
  final d=b.getdatacoin(ltc,s1);




  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

var rate1;
var rate2;
var rate3;
  Future<dynamic> gd() async
  {

     var s=await widget.a;
     var m=await widget.c;
     var n=await widget.d;

     print('s=$s');
     setState(() {
       rate1=s.toStringAsFixed(2);
       rate2=m.toStringAsFixed(2);
       rate3=n.toStringAsFixed(2);

     });

  }


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
     gd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          container(coin:btc,rate: rate1),
          container(coin:etc,rate: rate2),
          container(coin:ltc,rate: rate3),









          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: CupertinoPicker(
                itemExtent: 32,
                onSelectedItemChanged:(selectedIndex)  async
                {  setState(() {
                  s1=currenciesList[selectedIndex];
                });

                     print(s1);
                     var y = await b.getdatacoin(btc,s1);
                     var t=await b.getdatacoin(etc, s1);
                     var r=await b.getdatacoin(ltc, s1);

                     setState(() {

                       rate1 = y.toStringAsFixed(2);

                       rate2=t.toStringAsFixed(2);
                       rate3=r.toStringAsFixed(2);

                     });



                },
                children:list2(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class container extends StatelessWidget {
  const container({
    Key key,
    @required this.coin,this.rate,
  }) : super(key: key);

  final  rate;
  final coin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $coin = $rate $s1',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

String s1='USD';
String btc='BTC';
String etc='ETC';
String ltc='LTC';

List<Text> list2()
{
  List<Text> l1=[];
  for(String s in currenciesList)
    {
      l1.add(Text(s));
    }

  return l1;

}
