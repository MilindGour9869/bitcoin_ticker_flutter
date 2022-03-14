 import 'package:http/http.dart' as http;
import 'dart:convert';




const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {



   Future<dynamic> getdatacoin(  String s2 , String s3) async
   {
     http.Response r= await http.get('https://rest.coinapi.io/v1/exchangerate/$s2/$s3?apiKey=38277E37-A95D-49AB-9156-14EA3399E4FC');
     String data = r.body;
     if(r.statusCode==200)
       {
         var dat=jsonDecode(data)['rate'];

         return dat;
       }
     else
       {
         print(r.statusCode);
         return 0;
       }
   }









}

CoinData b=CoinData();

