import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'media-query-parameters.dart';



class MediaQuerySize {

  static _MediaQuery get(BuildContext context) => _MediaQuery(context: context);
}

class _MediaQuery {
  BuildContext context;
  var width;
  var height;

  _MediaQuery({this.context}){
    width =  MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  double get fontSize {
    return Paramenters(width: width,height: height).mainFontSize;
  }

  double get fontSizeTrocarBatida{
    return Paramenters(width: width,height: height).fontSizeTrocarBatida;
  }

  double get tittleFontSize {
    return Paramenters(width: width,height: height).titleFontSize;
  }

  double get styleTittleDialogSize {
    return Paramenters(width: width,height: height).tittleFontSizeDialog;
  }
  double get fontSizeButton {
    return Paramenters(width: width,height: height).fontSizeButton;
  }

  double get subTitleFontSize {
    return Paramenters(width: width,height: height).subTitleFontSize;
  }

  double get  fontSizeLeadinCancelar{
    return Paramenters(width: width,height: height).fontSizeLeadinCancelar;
  }

  double get  iconCameraBatidaView{
    return Paramenters(width: width,height: height).iconCameraBatidaView;
  }
  double get  iconSizePadrao{
    return Paramenters(width: width,height: height).iconSizePadrao;
  }

  double get iconTrocar{
    return Paramenters(width: width,height: height).iconTrocar;
  }

  double get iconSizeRelogioSeconds{
    return Paramenters(width: width,height: height).iconSizeRelogioSeconds;
  }

  double get iconSizeRelogio{

    return Paramenters(width: width,height: height).iconSizeRelogio;
  }

  double get margemDeToleranciaTextSize{
    return Paramenters(width: width,height: height).margemDeToleranciaTextSize;
  }

  double get  styleHoraTextMaior{
    return Paramenters(width: width,height: height).styleHoraTextMaior;
  }

  Color get color {
    return Paramenters(width: width,height: height).color;
  }

}