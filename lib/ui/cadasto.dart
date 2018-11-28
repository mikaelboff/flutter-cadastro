import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioController = new TextEditingController();
  final TextEditingController _senhaController = new TextEditingController();
  String _bemvindo = "";

  void _mostraBemVindo() {
    setState(() {
      if (_usuarioController.text.isNotEmpty &&
          _senhaController.text.isNotEmpty) {
        _bemvindo = "Bem-vindo ${_usuarioController.text}!";
      } else {
        _bemvindo = "Vazio";
      }
    });
  }

  void _cancelar() {
    _usuarioController.clear();
    _senhaController.clear();
    setState(() {
      _bemvindo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            // Imagem/profile
            Image.asset(
              "assets/face.png",
              width: 90.0,
              height: 90.0,
              color: Colors.white,
            ),

            // Form de cadastro
            Container(
              width: double.infinity,
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _usuarioController,
                      decoration: InputDecoration(
                        hintText: "Nome",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.5),
                        ),
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                        hintText: "Senha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.5),
                        ),
                        icon: Icon(Icons.vpn_key),
                      ),
                      obscureText: true,
                    ),
                  ),

                  // Botões

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: RaisedButton(
                            onPressed: () => _mostraBemVindo(),
                            color: Colors.white70,
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        ),

                        // Cancelar
                        Container(
                          //margin: const EdgeInsets.only(right: 38.0),
                          child: RaisedButton(
                            onPressed: () => _cancelar(),
                            color: Colors.white70,
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // TEXTO
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _bemvindo,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.6,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
