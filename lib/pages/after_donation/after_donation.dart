import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrecautionsAfterDonation extends StatelessWidget {
  const PrecautionsAfterDonation({Key? key}) : super(key: key);

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
              child: Text('AFTER BLOOD DONATION',style: TextStyle(color: Colors.white,fontSize: 12),),
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
              
              Text('1. Do not get immediately after the process is over, rest for at least 5 minutes.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
             Text('2. Eat something that is rich in sugar post blood donation as it can up your energy levels and prevent you from feeling weak and dizzy.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
             Text('3. Increase your fluid intake for the next 24 to 48 hours as it might take around 24 hours for the body to get the fluids retrieved post blood donation.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
             Text('4. Stay away from drinking aerated drinks or carbonated beverages.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
             Text('5. Avoid strenuous physical exertion, heavy lifting or pulling with the donation arm for about five hours.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
             Text('6. Eat well balanced meals for the next 24 hours to rejuvenate your body.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
             Text('7. Do not smoke or consume alcohol for at least 24 hours after donation.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
               
            ],
          ),
        ),
      ),
    );
    
  }
}