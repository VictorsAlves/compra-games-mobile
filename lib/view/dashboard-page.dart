import 'package:compra_games/presenter/dashboard-presenter.dart';
import 'package:compra_games/utils/conversores.dart';
import 'package:compra_games/view/style/main-style.dart';
import 'package:compra_games/view/viewmodel/poduto-view-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'components/configurable-expansion-tile.dart';
import 'components/custom-appbar.dart';
import 'detalhe-produto-page.dart';

class DashboardPage extends StatefulWidget {
  static final String ROUTER = "/dashboard";

  DashboardPage();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  DashboardPresenter _presenter;
  int _selectedItemIndex = 0;
  List<ProdutoViewModel> produto = [
    ProdutoViewModel(
        title: "jogo 1",
        description: "Descricao lorem ipsun 1",
        labels: "labels",
        plataform: "playstation"),
    ProdutoViewModel(
        title: "jogo 2",
        description: "Descricao lorem ipsun 2",
        labels: "labels",
        plataform: "playstation"),
    ProdutoViewModel(
        title: "jogo 2",
        description: "Descricao lorem ipsun 2",
        labels: "labels",
        plataform: "playstation"),
    ProdutoViewModel(
        title: "jogo 2",
        description: "Descricao lorem ipsun 2",
        labels: "labels",
        plataform: "playstation"),
    ProdutoViewModel(
        title: "jogo 2",
        description: "Descricao lorem ipsun 2",
        labels: "labels",
        plataform: "playstation")
  ];

  ScrollController _controller = new ScrollController();

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
        ),
        backgroundColor: Color(0xffEFEFF4),
        body: Column(
          children: <Widget>[
            Container(margin: const EdgeInsets.only(bottom: 0.0, top: 20)),
            if (produto == null) _carregandoDados() else _lista(produto)
          ],
        ));
  }

  Widget _lista(
    List<ProdutoViewModel> p,
  ) {
    var _produtosList = p;
    return new Expanded(
        child: ListWheelScrollView(
            onSelectedItemChanged: (index) => {
              setState(() {
                _selectedItemIndex = index;
              })
            },
           
            physics: FixedExtentScrollPhysics(),
            itemExtent: 300.0,
            children: _produtosList
                .map((movie) => Column(
                      children: <Widget>[CardProduct(), SizedBox(height: 30.0)],
                    ))
                .toList()));
  }

  Widget CardProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.disc_full,
          size: 90,
        ),
        Container(
          color: Colors.black26,
          height: 100,
          width: 250,
          child: Column(
            children: <Widget>[
              Text("NOME PRODUTO"),
              Text("BREVE DESCRIÇÃO CLIQUE MAIS PRA SABER"),
              Text("VALOR"),
              Icon(Icons.add)
            ],
          ),
        )
      ],
    );
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

  Widget animatedList() {}

  initView() async {}
}
