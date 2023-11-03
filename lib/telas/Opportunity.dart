import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../telasdefotos/ftopportunity.dart';
import 'Limitacao.dart';

class Opportunity extends StatefulWidget{
  @override
  State<Opportunity> createState() => _PerseveranceState();
}

class _PerseveranceState extends State<Opportunity> {
  TextEditingController controller = TextEditingController();
 @override
  Widget build(BuildContext context) {
   return Scaffold(
   appBar: AppBar(title: Text("Fotos de Marte com o Rover Opportunity")),
   body: ListView(
    children:[ 
      Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              CustomLimitacao(maxInputValue: 3495),
            ],
            decoration: const InputDecoration(
              hintText: 'Digite o sol (dia em Marte)',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, digite algo';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FtsO(controller.text),
                        ));
              },
              child: const Text('Procurar'),
            ),
          ),
        ],

      
    )]

   ),
   );
  }
}