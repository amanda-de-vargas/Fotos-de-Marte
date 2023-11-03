import 'package:flutter/material.dart';
import 'package:marsphotos/telas/Curiosity.dart';
import 'package:marsphotos/telas/Opportunity.dart';
import 'package:marsphotos/telas/Perseverance.dart';
import 'package:marsphotos/telas/Spirit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Phudu',
        brightness: Brightness.dark,
        colorSchemeSeed: Color.fromARGB(0, 107, 89, 74),
         useMaterial3: true,
      ),
      home: PgPrincipal(),
    );
  }
}

class PgPrincipal extends StatefulWidget {
  PgPrincipal({super.key});
  @override
  State<PgPrincipal> createState() => _PgPrincipalState();
}

class _PgPrincipalState extends State<PgPrincipal> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:(Text("Fotos de Marte")),
      ),
      body: 
      
      Center(

        child: ListView(
        children:[
          Center(child: Title(color: Colors.white, child: Text("Escolha o Rover:", style: TextStyle(fontSize: 20.0)), 
          )),
          Container(
             margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                
          
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Curiosity(),
                        ));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage('images/Curiosity_rover.jpg'),),
                        Container(child: Column(
                          children: [
                            Text("Curiosity"),
                            Text("677961 fotos",
                            style: TextStyle(
                              fontSize: 11,
                            ),)
                          ],
                        ),
                         margin: EdgeInsets.only(bottom: 20),),
                      ],
                    ),
                  ),
                ),
          
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Opportunity(),
                        ));
                  },
                  child: Container(
                     margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage('images/Opportunity_rover.jpg'),),
                        const Text("Opportunity"),
                        Text("198439 fotos",
                            style: TextStyle(
                              fontSize: 11,
                            ),)
                      ],
                    ),
                  ),
                ),
          
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Perseverance(),
                        ));
                  },
                  child: Container(
                     margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage('images/Perseverance_rover.jpg'),),
                        const Text("Perseverance"),
                        Text("178994 fotos",
                            style: TextStyle(
                              fontSize: 11,
                            ),)
                      ],
                    ),
                  ),
                ),
          
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Spirit(),
                        ));
                  },
                  child: Container(
                     margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage('images/Spirit_rover.jpg'),),
                        const Text("Spirit"),
                        Text("124550 fotos",
                            style: TextStyle(
                              fontSize: 11,
                            ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],)
      ),
    );
  }
}


