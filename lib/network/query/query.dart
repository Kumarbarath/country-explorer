class CustomQuery {
  static String countryList='''
  query {
  countries {
    name
    capital
    currency
    emoji
    languages {
      name
    }
  }
}
  ''';
}