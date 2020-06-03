import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'media-query.dart';

class MainStyle {
  static const Color APP_THEME = const Color(0xff2BB9B4);

  static _MainStyle get(BuildContext context) => _MainStyle(context: context);
}

class _MainStyle {
  BuildContext context;

  _MainStyle({this.context});

  TextStyle get mainStyleText {
    return new TextStyle(
        color: MediaQuerySize.get(context).color,
        fontWeight: FontWeight.w400,
        fontSize: MediaQuerySize.get(context).fontSize);
  }

  TextStyle get mainStyleTextSizeZHeaderExpansion {
    return new TextStyle(
        color: MediaQuerySize.get(context).color,
        fontWeight: FontWeight.w400,
        fontSize: MediaQuerySize.get(context).subTitleFontSize);
  }

  TextStyle get mainStyleTextDiaSemnaBatidaView {
    return new TextStyle(
        color: Color(0xffA3A3A3),
        fontWeight: FontWeight.w400,
        fontSize: MediaQuerySize.get(context).subTitleFontSize);
  }

  TextStyle get mainStyleTextSizeWhiteBoldin {
    return new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: MediaQuerySize.get(context).subTitleFontSize);
  }

  TextStyle get mainStyleTextWhite {
    return new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: MediaQuerySize.get(context).fontSize);
  }

  TextStyle get styleTextWhiteUnderline {
    return new TextStyle(
        color: Colors.white,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w400,
        fontSize: MediaQuerySize.get(context).fontSize);
  }

  TextStyle get titleStyleText {
    return new TextStyle(
        color: MediaQuerySize.get(context).color,
        fontWeight: FontWeight.w700,
        fontSize: MediaQuerySize.get(context).tittleFontSize);
  }

  TextStyle get styleButtonText {
    return new TextStyle(
        color: MediaQuerySize.get(context).color,
        fontWeight: FontWeight.w700,
        fontSize: MediaQuerySize.get(context).fontSizeButton);
  }

  TextStyle get styleButtonTextWhite {
    return new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: MediaQuerySize.get(context).fontSizeButton);
  }

  TextStyle get styleInputText {
    return new TextStyle(
        color: MediaQuerySize.get(context).color,
        fontWeight: FontWeight.w400,
        fontSize: MediaQuerySize.get(context).tittleFontSize);
  }

  TextStyle get styleHintTextGrey {
    return new TextStyle(
        color: Color(0xffC7C7CC),
        fontSize: MediaQuerySize.get(context).fontSizeButton);
  }

  TextStyle get styleTittleDialog {
    return new TextStyle(
        color: MediaQuerySize.get(context).color,
        fontWeight: FontWeight.w700,
        fontSize: MediaQuerySize.get(context).styleTittleDialogSize);
  }

  double get marginRightLeft {
    return 16.0;
  }

  Color get color {
    return Color(0xff999999);
  }

  Color get backgroundColor {
    return Color(0xffff0f0f0);
  }

  double get fontSizeOnlineOffline {
    return MediaQuerySize.get(context).subTitleFontSize;
  }

  double get fontSizeLeadinCancelar {
    return MediaQuerySize.get(context).fontSizeLeadinCancelar;
  }

// o text size PAdrao:
  double get fontSizePadrao {
    return MediaQuerySize.get(context).fontSize;
  }

  double get fontSizeButton {
    return MediaQuerySize.get(context).fontSizeButton;
  }

  double get fontSizeTrocarBatida {
    return MediaQuerySize.get(context).fontSizeTrocarBatida;
  }

  double get iconCameraBatidaView {
    return MediaQuerySize.get(context).iconCameraBatidaView;
  }

  double get iconSizePadrao {
    return MediaQuerySize.get(context).iconSizePadrao;
  }

  double get iconTrocar {
    return MediaQuerySize.get(context).iconTrocar;
  }

  double get iconSizeRelogio {
    return MediaQuerySize.get(context).iconSizeRelogio;
  }

  double get margemDeToleranciaTextSize {
    return MediaQuerySize.get(context).margemDeToleranciaTextSize;
  }

  double get iconSizeRelogioSeconds {
    return MediaQuerySize.get(context).iconSizeRelogioSeconds;
  }

  TextStyle get styleHoraTextMaior {
    return new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: MediaQuerySize.get(context).styleHoraTextMaior);
  }

  double get fontSizeHoraReal {
    return MediaQuerySize.get(context).tittleFontSize;
  }

  double get dotRelogio {
    return MediaQuerySize.get(context).styleHoraTextMaior;
  }

  double get subTitleFontSize {
    return MediaQuerySize.get(context).subTitleFontSize;
  }
}
