import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paramenters {

  double width;
  double height;

  Paramenters({this.width,this.height});

  int xs = 320;
  int x  = 600;

  double get mainFontSize {

    double fontSize = 0;

    if(width <= xs)
    {
      fontSize = 12;
    }
    else if (width > xs && width <= x )
    {
      fontSize = 14;
    }
    return fontSize;
  }

  double get fontSizeTrocarBatida{
    double fontSize = 0;

    if(width <= xs)
    {
      fontSize = 14;
    }
    else if (width > xs && width <= x )
    {
      fontSize = 16;
    }
    return fontSize;
  }

  double get fontSizeButton {

    double fontSize = 0;

    if(width <= xs)
    {
      fontSize = 16;
    }
    else if (width > xs && width <= x )
    {
      fontSize = 20;
    }
    return fontSize;
  }

  double get subTitleFontSize {

    double fontSize = 0;

    if(width <= xs)
    {
      fontSize = 11;
    }
    else if (width > xs && width <= x )
    {
      fontSize = 12;
    }
    return fontSize;
  }

  double get titleFontSize {

    double fontSize = 0;

    if(width <= xs)
    {
      fontSize = 15;
    }
    else if (width > xs && width <= x )
    {
      fontSize = 18;
    }
    return fontSize;
  }

  Color get color {
    return Colors.black;
  }

  Color get backgroundColor {
    return Color(0xffff0f0f0);
  }

  double get iconCameraBatidaView{
    double size = 0;

    if(width <= xs)
    {
      size = 60;
    }
    else if (width > xs && width <= x )
    {
      size = 70;
    }
    return size;
  }
//buton text dos dialogs
  double get fontSizeLeadinCancelar {

    double fontsize = 0;

    if(width <= xs)
    {
      fontsize = 12;
    }
    else if (width > xs && width <= x )
    {
      fontsize = 15;
    }
    return fontsize;
  }

  double get styleHoraTextMaior{
    double fontSize = 0;

    if(width <= xs)
    {
      fontSize = 28;
    }
    else if (width > xs && width <= x )
    {
      fontSize = 32;
    }
    return fontSize;
  }
  double get iconSizeRelogio{
    double size = 0;

    if(width <= xs)
    {
      size = 42;
    }
    else if (width > xs && width <= x )
    {
      size = 32;
    }
    return size;
  }

  double get margemDeToleranciaTextSize{
    double fontSize = 0;

    if(width <= xs)
    {
      fontSize = 10;
    }
    else if (width > xs && width <= x )
    {
      fontSize = 12;
    }
    return fontSize;
  }
  double get iconSizeRelogioSeconds{
    double size = 0;

    if(width <= xs)
    {
      size = 16;
    }
    else if (width > xs && width <= x )
    {
      size = 20;
    }
    return size;
  }

  double get iconSizePadrao{
    double size = 0;

    if(width <= xs)
    {
      size = 20;
    }
    else if (width > xs && width <= x )
    {
      size = 24;
    }
    return size;
  }

  double get iconTrocar{
    double size = 0;

    if(width <= xs)
    {
      size = 16;
    }
    else if (width > xs && width <= x )
    {
      size = 18;
    }
    return size;
  }

  double get tittleFontSizeDialog {

    double fontSize = 0;

    if(width <= xs)
    {
      fontSize = 13;
    }
    else if (width > xs && width <= x )
    {
      fontSize = 16;
    }
    return fontSize;
  }


}