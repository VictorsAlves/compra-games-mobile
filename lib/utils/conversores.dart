class Conversores {
  static String convertDatetimeToStringDate(String data) {
    //iso 860
    String d = data.substring(0, data.indexOf("T"));
    String ano = "";
    String dia = "";
    String mes = "";
    for (int i = 0; i < d.length; i++) {
      if (i < 4) {
        ano = ano + d[i];
      }
      if (i > 3 && i < d.length - 2) {
        mes = mes + d[i];
      }
      if (i > d.length - 3) {
        dia = dia + d[i];
      }
    }

    String result = dia + mes + ano;
    result = result.replaceAll("-", "/");
    return result;
  }

  static String convertDateToDayOfWeek(String data) {
    //iso 860
    String dat = data.substring(0, data.indexOf("T")).replaceAll("-", "");
    String dia = "";
    String mes = "";
    String ano = "";
    String result = "";

    for (int i = 0; i < dat.length; i++) {
      if (i < 4) {
        ano = ano + dat[i];
      }
      if (i > 3 && i < dat.length - 2) {
        mes = mes + dat[i];
      }
      if (i > dat.length - 3) {
        dia = dia + dat[i];
      }
    }

    var a = int.tryParse(ano);
    var m = int.tryParse(mes);
    var d = int.tryParse(dia);
    var novaData = DateTime(a, m, d);

    switch (novaData.weekday) {
      case 1:
        result = "Segunda";
        break;
      case 2:
        result = "Terça-Feira";
        break;
      case 3:
        result = "Quarta-Feira";
        break;
      case 4:
        result = "Quinta-Feira";
        break;
      case 5:
        result = "Sexta-Feira";
        break;
      case 6:
        result = "Sabádo";
        break;
      case 7:
        result = "Domingo";
        break;
    }
    return result;
  }

  static String convertDatetimeToStringDateDayMonth(String data) {
    //iso 860
    String d = data.substring(0, data.indexOf("T"));
    String dia = "";
    String mes = "";
    for (int i = 0; i < d.length; i++) {
      if (i > 3 && i < d.length - 3) {
        mes = mes + d[i];
      }
      if (i > d.length - 3) {
        dia = dia + d[i];
      }
    }

    String result = dia + mes;
    result = result.replaceAll("-", "/");
    return result;
  }

  static convertDatetimeToStringTimeNoSeconds(String time) {
    //iso 860
    String t = time.substring(time.indexOf("T"), time.indexOf(":") + 3);
    String hora = "";
    String minuto = "";
    for (int i = 0; i < t.length; i++) {
      if (i > 3) {
        minuto = minuto + t[i];
      }
      if (i < t.length - 2 && i > 0) {
        hora = hora + t[i];
      }
    }
    String result = hora + minuto;
    return result;
  }
}
