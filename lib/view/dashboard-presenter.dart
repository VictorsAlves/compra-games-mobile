import 'package:compra_games/presenter/dashboard-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'i-presenter.dart';


class DashboardPresenter extends IPresenter<DashboardPage> {
  DashboardPresenter(State<DashboardPage> state) : super(state: state);
  bool naoExecutando = true;
  var dadosSincronizados;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Future initView() {
    return null;
  }
  void refreshList() async {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 4000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    refreshController.refreshCompleted(resetFooterState: true);
    //refreshController.loadComplete();
  }
}
