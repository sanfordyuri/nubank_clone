import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 240.0,
            width: double.maxFinite,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 32.0, 0.0, 0.0),
                  child: IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.close, color: Colors.grey[600],),),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 16.0, 0.0, 0.0),
                      child: CircleAvatar(
                        radius: 24,
                        child: Icon(
                          Icons.person_outline_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                        backgroundColor: Colors.purple,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 16.0, 0.0, 0.0),
                      child: Text('Yuri', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 24.0, 0.0, 0.0),
                  child: Text('Agência 0001 • Conta 28983474-8\nBanco 0254 • Nu Pagamentos S.A. - Instituição de\nPagamento', style: TextStyle(fontWeight: FontWeight.bold),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}