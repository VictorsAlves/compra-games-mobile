import 'package:compra_games/presenter/components/configurable-expansion-tile.dart';
import 'package:compra_games/presenter/detalhe-produto-page.dart';
import 'package:compra_games/presenter/style/main-style.dart';
import 'package:compra_games/utils/conversores.dart';
import 'package:compra_games/view/dashboard-presenter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'components/custom-appbar.dart';

class DashboardPage extends StatefulWidget {
  static final String ROUTER = "/dashboard";

  DashboardPage();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  DashboardPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = DashboardPresenter(this);
    initView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          noRunning: _presenter.naoExecutando,
          expandable: _presenter.naoExecutando,
          card: _topBarCard(),
        ),
        backgroundColor: Color(0xffEFEFF4),
        body: Column(
          children: <Widget>[
            Container(margin: const EdgeInsets.only(bottom: 0.0, top: 20)),
            if (_presenter.dadosSincronizados == null)
              _carregandoDados()
            else if (_presenter.dadosSincronizados == true)
              new Container()
            else
              new Container()
          ],
        ));
  }

  Widget _topBarCard() {
    var card;
    return (card != null)
        ? Container(
            width: 330,
            height: 146,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 2,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalheProdutoPage())),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 0.0,
                            left: 9.0,
                            right: 5,
                            top: 8.0,
                            child: (card.ordem < 10) //zero a esquerda
                                ? Text(
                                    "0" + card.ordem.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                : Text(card.ordem.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Icon(
                            Icons.fiber_manual_record,
                            color: Colors.black12,
                            size: 34.0,
                          ),
                        ],
                      ),
                      Text(
                        "${card.titulo}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 26,
                        ),
                        child: Text(
                          Conversores.convertDatetimeToStringDateDayMonth(
                                  card.dataCriacao) +
                              " ",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Container(
                        child: Text(
                          Conversores.convertDatetimeToStringTimeNoSeconds(
                              card.dataCriacao),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.only(left: 6, top: 7),
                      child: Text(
                        "ATENDIMENTO",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      width: 96,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 6),
                      padding: EdgeInsets.all(4),
                      height: 25,
                      child: (card.sla != null || card.sla != "")
                          ? Text(
                              "SLA - " + card.sla,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          : Text(
                              "SLA - " + card.sla,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 54,
                      ),
                      child: Text(
                        "ID - " +
                            card.idOrdemServico
                                .substring(0, card.idOrdemServico.indexOf("-")),
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                /*  Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.label,
                        color: Colors.black12,
                      ),
                      Text(
                        card[0].ambiente,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              */
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[],
                      ),
                      Icon(
                        Icons.label,
                        color: Colors.black12,
                      ),
                      Text(
                        card.ambiente,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      /*Icon(
                        Icons.label,
                        color: Colors.black12,
                      ),
                      Text(
                        card[0].categoria,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          )
        : new Container();
  }

  Widget _cardOrderService(var card) {
    if (!card.inProgress && card != null) {
      return new Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: new Material(
          elevation: 2,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          child: ConfigurableExpansionTile(
            animatedWidgetFollowingHeader: new Container(
              padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
              child: new Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ),
            header: new Expanded(
              child: IntrinsicHeight(
                child: new Container(
                  margin: EdgeInsets.only(
                      left: 1.0, right: 1.0, bottom: 0.0, top: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  alignment: Alignment.centerLeft,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Expanded(
                        flex: 100,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new InkWell(
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(5)),
                              onTap: () {
                                print('Indo para pagina de detalhes');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetalheProdutoPage()));
                              },
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          bottom: 0.0,
                                          left: 9.0,
                                          right: 5,
                                          top: 8.0,
                                          child: (card.ordem <
                                                  10) //zero a esquerda
                                              ? Text(
                                                  "0" + card.ordem.toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : Text(card.ordem.toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                        ),
                                        Icon(
                                          Icons.fiber_manual_record,
                                          color: Colors.black12,
                                          size: 34.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Container(
                                    //titulo
                                    width: 150,
                                    margin:
                                        EdgeInsets.only(bottom: 6.0, top: 6.0),
                                    child: Text(
                                      card.titulo.toUpperCase(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 6,
                                    ),
                                    margin: EdgeInsets.only(left: 30),
                                    child: Text(
                                      Conversores
                                          .convertDatetimeToStringDateDayMonth(
                                              card.dataCriacao),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    child: Text(
                                      Conversores
                                          .convertDatetimeToStringTimeNoSeconds(
                                              card.dataCriacao),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            new Divider(
                              color: Colors.black12,
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                (card.status.toUpperCase() == "ABERTO")
                                    ? Container(
                                        margin: EdgeInsets.only(left: 5),
                                        padding:
                                            EdgeInsets.only(left: 6, top: 7),
                                        child: Text(
                                          "O.S PENDENTE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        width: 96,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(left: 5),
                                        padding:
                                            EdgeInsets.only(left: 6, top: 7),
                                        child: Text(
                                          "CANCELADO",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        width: 96,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                (card.sla != null && card.sla != "")
                                    ? Container(
                                        margin: EdgeInsets.only(left: 6),
                                        padding: EdgeInsets.all(4),
                                        height: 25,
                                        child: Text(
                                          "SLA - " + card.sla,
                                          style: TextStyle(
                                              fontSize: 13, color: Colors.grey),
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black12,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                      )
                                    : new Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        //DIVIDER VERTICAL
                        color: Colors.grey,
                        height: 90.0,
                        width: 0.2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            children: <Widget>[
              new Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color(0xffF0F0F0),
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                ),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                          padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.grey.withOpacity(0.2)))),
                          child: new Container()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else
      return new Container();
  }

  Widget _carregandoDados() {
    return new Expanded(
        child: SmartRefresher(
      enablePullDown: true,
      controller: _presenter.refreshController,
      onLoading: _presenter.refreshList,
      header: ClassicHeader(
        idleText: "Puxe para atualizar",
        releaseText: "Solte para atualizar",
        refreshingText: "Atualizando",
        completeText: "Sua lista está atualizada!",
        iconPos: IconPosition.right,
      ),
      child: new ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return new Card(
              elevation: 1.5,
              margin:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 2),
              child: new Container(
                  margin: const EdgeInsets.only(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: new Container(
                    margin: const EdgeInsets.only(bottom: 12, left: 8),
                    child: new ListTile(
                      dense: true,
                      onTap: () {},
                      contentPadding: const EdgeInsets.only(right: 2, top: 8),
                      trailing: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Icon(Icons.arrow_drop_down,
                            size: MainStyle.get(context).iconSizePadrao),
                      ),
                      title: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Expanded(
                              flex: 9,
                              child: SizedBox(
                                child: Shimmer.fromColors(
                                  baseColor: Color(0xffe6e6e6),
                                  highlightColor: Colors.white,
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffe6e6e6),
                                      border: new Border.all(
                                          color: Colors.white, width: 8),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    // margin: EdgeInsets.only(left: 16, bottom: 16),
                                    height: 20,
                                    width: 120,
                                  ),
                                ),
                              )),
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                height: 50.0,
                                width: 24.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                              new Container(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: SizedBox(
                                    child: Shimmer.fromColors(
                                      baseColor: Color(0xffe6e6e6),
                                      highlightColor: Colors.white,
                                      child: new Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffe6e6e6),
                                          border: new Border.all(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        //margin: EdgeInsets.only(left: 16, bottom: 16),
                                        height: 20,
                                        width: 120,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      subtitle: new Row(
                        children: <Widget>[
                          new Expanded(
                              flex: 9,
                              child: SizedBox(
                                child: Shimmer.fromColors(
                                  baseColor: Color(0xffe6e6e6),
                                  highlightColor: Colors.white,
                                  child: new Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffe6e6e6),
                                      border: new Border.all(
                                          color: Colors.white, width: 4),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    // margin: EdgeInsets.only(left: 16, bottom: 16),
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      //subtitle: new Container(),
                    ),
                  )),
            );
          }),
    ));
  }

  initView() async {}
}
