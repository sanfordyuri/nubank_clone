import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:nubank_clone/screens/perfil_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  IconData icon_visibility = Icons.visibility_outlined;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool _mostrarValores = true;

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 300));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: CustomHeader(
          refreshStyle: RefreshStyle.Behind,
          builder: (BuildContext context, RefreshStatus? mode) {
            return Container(
              color: Colors.purple[800],
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBar(),
              aboveAppBar(),
              contaWithIcon(),
              saldoView(),
              listViewButtons(),
              meuCartoes(),
              painelDeInformacoes(),
              Divider(
                color: Colors.grey.withOpacity(0.25),
                height: 32.0,
                thickness: 2.0,
              ),
              AreaCartao(),
              AreaEmprestimo(),
              AreaSeguroDeVida(),
              descubraMensagem(),
              listDescubra()
            ],
          ),
        ),
      ),
    );
  }

  Padding descubraMensagem() {
    return Padding(
      padding: EdgeInsets.fromLTRB(22, 0.0, 24.0, 8.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Descubra mais',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          )),
    );
  }

  Column listDescubra() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 190.0,
          width: double.maxFinite,
          padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    width: 280,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 24.0, 0.0, 4.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'WhatsApp ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            WidgetSpan(
                                child: Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                              ),
                              child: Text(
                                'Novo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )),
                            WidgetSpan(
                                child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: Text(
                                    'Pagamentos seguros, rápidos e \nsem tarifa. A experiência\nNubank sem sair da ...',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0)),
                              ),
                            )),
                            WidgetSpan(
                                child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 32.0,
                                width: 140.0,
                                child: Text(
                                  'Quero conhecer',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 8.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    width: 280,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32.0, 24.0, 0.0, 4.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Indique seus amigos ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          children: [
                            WidgetSpan(
                                child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: Text(
                                    'Mostre aos seus amigos como é\nfácil ter uma vida sem\nburocracia.',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0)),
                              ),
                            )),
                            WidgetSpan(
                                child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 32.0,
                                width: 140.0,
                                child: Text(
                                  'Indicar amigos',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column AreaSeguroDeVida() {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0.0, 24.0, 0.0),
              child: Icon(Icons.favorite_border),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0.0, 24.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seguro de vida',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      splashRadius: 20.0,
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: Colors.grey[600],
                      )),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 4.0, 24.0, 0.0),
            child: Text(
              'Conheça Nubank Vida: um seguro simples \ne que cabe no bolso.',
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.25),
          height: 40.0,
          thickness: 2.0,
        ),
      ],
    );
  }

  Column AreaEmprestimo() {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0.0, 24.0, 0.0),
              child: Icon(Icons.attach_money),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0.0, 24.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Empréstimo',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      splashRadius: 20.0,
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: Colors.grey[600],
                      )),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 4.0, 24.0, 0.0),
            child: Text(
              'Valor disponível de até',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 4.0, 24.0, 0.0),
            child: Text(
              'R\$ 12.500,00',
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.25),
          height: 40.0,
          thickness: 2.0,
        ),
      ],
    );
  }

  Column AreaCartao() {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0.0, 24.0, 0.0),
              child: Icon(Icons.account_balance_wallet_outlined),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0.0, 24.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cartão de crédito',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      splashRadius: 20.0,
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: Colors.grey[600],
                      )),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 4.0, 24.0, 0.0),
            child: Text(
              'Fatura atual',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8.0, 24.0, 0.0),
            child: Column(
              children: [
                Visibility(
                  visible: _mostrarValores,
                  child: Text(
                    'R\$ 0,00',
                    style: TextStyle(fontSize: 24.0, color: Colors.black),
                  ),
                ),
                Visibility(
                  visible: !_mostrarValores,
                  child: Container(
                    height: 40.0,
                    width: 250.0,
                    color: Colors.grey.withOpacity(0.25),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 4.0, 24.0, 0.0),
            child: Text(
              'Limite disponível de R\$ 250.000,00',
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.25),
          height: 40.0,
          thickness: 2.0,
        ),
      ],
    );
  }

  Container painelDeInformacoes() {
    return Container(
      height: 105.0,
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              width: 280,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Você tem R\$ 12.500,00',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\ndisponíveis para ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: ' empréstimo.',
                          style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 32.0, 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              width: 280,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Consquiste planos futuros:',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: '\nconheça as opções para',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: ' guard...',
                          style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding meuCartoes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          height: 50.0,
          width: 350.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                    child: Icon(Icons.account_balance_wallet_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Meus cartões',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container listViewButtons() {
    return Container(
      height: 160,
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 8.0, 8.0, 0.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Área Pix',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  child: Icon(
                    Icons.bar_chart,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pagar',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  child: Icon(
                    Icons.payment,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Transferir',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  child: Icon(
                    Icons.payments_outlined,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Depositar',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pegar\nemprestado',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  child: Icon(
                    Icons.smartphone,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Recarga\nde celular',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  child: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cobrar',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 24.0, 0.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey.withOpacity(0.15),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Doação',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding saldoView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 8.0, 24.0, 8.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Visibility(
                visible: _mostrarValores,
                child: Text(
                  'R\$ 137.450,00',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Visibility(
                visible: !_mostrarValores,
                child: Container(
                  height: 40.0,
                  width: 250.0,
                  color: Colors.grey.withOpacity(0.25),
                ),
              )
            ],
          )),
    );
  }

  Padding contaWithIcon() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 16.0, 24.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Conta',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
          IconButton(
              splashRadius: 20.0,
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: Colors.grey[600],
              )),
        ],
      ),
    );
  }

  Column aboveAppBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          decoration: new BoxDecoration(
              color: Colors.purple[800],
              border: new Border.all(color: Colors.purple[800]!)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 24.0),
            child: Text(
              'Olá, Yuri',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: new BoxDecoration(
              color: Colors.purple[800],
              border: new Border.all(color: Colors.purple[800]!)),
          height: 115,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 0.0, 24.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: CircleAvatar(
                            radius: 24,
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            backgroundColor: Colors.white.withOpacity(0.15),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilPage()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              splashRadius: 20.0,
                              onPressed: () {
                                setState(() {
                                  if (icon_visibility ==
                                      Icons.visibility_outlined) {
                                    icon_visibility =
                                        Icons.visibility_off_outlined;
                                    _mostrarValores = false;
                                  } else {
                                    icon_visibility = Icons.visibility_outlined;
                                    _mostrarValores = true;
                                  }
                                });
                              },
                              icon: Icon(
                                icon_visibility,
                                color: Colors.white,
                                size: 26.0,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.help_outline,
                                color: Colors.white,
                                size: 26.0,
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.mark_email_read_outlined,
                                  color: Colors.white,
                                  size: 26.0,
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onReresh() async {
    return Future.delayed(Duration(seconds: 1), () => {});
    setState(() {});
  }
}
