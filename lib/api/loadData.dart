class LoadData {
  final List<Program> KiloVerme;
  final List<Program> KiloAlma;
  final List<Program> KiloKoruma;
  final List<Program> SaglikliBeslenme;
  final List<Program> UzunYasam;
  final List<Program> FazlaEnerji;


  LoadData({
    required this.KiloVerme,
    required this.KiloAlma,
    required this.KiloKoruma,
    required this.SaglikliBeslenme,
    required this.UzunYasam,
    required this.FazlaEnerji,
  });

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(
      KiloVerme: parseProgramList(json['KiloVerme']),
      KiloAlma: parseProgramList(json['KiloAlma']),
      KiloKoruma: parseProgramList(json['KiloKoruma']),
      SaglikliBeslenme: parseProgramList(json['SaglikliBeslenme']),
      UzunYasam: parseProgramList(json['UzunYasam']),
      FazlaEnerji: parseProgramList(json['FazlaEnerji']),
    );
  }

  static List<Program> parseProgramList(dynamic json) {
    if (json is List) {
      return json.map((item) => Program.fromJson(item)).toList();
    } else {
      throw Exception("Program listesi dönüştürülürken hata oluştu");
    }
  }
}

class Program {
  final String gun;
  final String sabah;
  final String ogle;
  final String araogun;
  final String aksam;

  Program({
    required this.gun,
    required this.sabah,
    required this.ogle,
    required this.araogun,
    required this.aksam,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      gun: json['gun'] as String,
      sabah: json['sabah'] as String,
      ogle: json['ogle'] as String,
      araogun: json['araogun'] as String,
      aksam: json['aksam'] as String,
    );
  }
}