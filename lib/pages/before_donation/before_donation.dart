import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrecautionsBeforeDonation extends StatelessWidget {
  const PrecautionsBeforeDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 95, 85),
        title: Column(
          children: [Padding(
              padding: const EdgeInsets.only(right:0.0),
              child: Text('PRECAUTIONS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26),),
            ),
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Text('BEFORE BLOOD DONATION',style: TextStyle(color: Colors.white,fontSize: 12),),
            ),],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 245, 95, 85),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right:10.0,left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Text('1. Always choose a licensed blood bank to donate blood & donate blood only where doctors are available.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              Text('2. Eat something light before donating blood and hydrate yourself as it helps you to avoid weakness.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              Text('3. Avoid drinking alcohol the day prior to blood donation.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              Text('4. Do not smoke for at least 2 hours before blood donation.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              Text('5. Make sure to check whether the paramedical staff is using a set of disposable needles for every single donor.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              Text('6. Carry at least two IDs before going for blood donation.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              Text('7. Do let the doctor know about medications you are taking, if any.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
               
            ],
          ),
        ),
      ),
    );
    
  }
}