class Language {
  final String name;

  Language({required this.name});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

class Country {
  final String? name;
  final String? capital;
  final String? currency;
  final String? emoji;
  final List<Language> languages;
  final String languagesString;

  Country({
    required this.name,
    required this.capital,
    required this.currency,
    required this.emoji,
    required this.languages,
    required this.languagesString,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    var languagesFromJson = json['languages'] as List;
    List<Language> languageList =
        languagesFromJson.map((i) => Language.fromJson(i)).toList();

    String parseListLanguages(List<Language> languages) {
      String languageString = '';
      for (var element in languages) {
        languageString = languageString.isEmpty?"${element.name}":"$languageString , ${element.name}";
      }
      return languageString;
    }

    return Country(
      languagesString: parseListLanguages(languageList),
      name: json['name'],
      capital: json['capital'],
      currency: json['currency'],
      emoji: json['emoji'],
      languages: languageList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'capital': capital,
      'currency': currency,
      'emoji': emoji,
      // 'languages': languages.map((language) => language.toJson()).toList(),
    };
  }
}

class Countries {
  final List<Country> countries;

  Countries({required this.countries});

  factory Countries.fromJson(Map<String, dynamic> json) {
    var countriesFromJson = json['countries'] as List;
    List<Country> countryList =
        countriesFromJson.map((i) => Country.fromJson(i)).toList();

    return Countries(
      countries: countryList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countries': countries.map((country) => country.toJson()).toList(),
    };
  }
}
