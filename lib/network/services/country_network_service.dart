import 'dart:convert';

import 'package:country_explorer/models/country_model.dart';
import 'package:country_explorer/network/query/query.dart';
import 'package:country_explorer/utils/config/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryNetworkService {
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  GraphQLClient client = graphQLConfig.clientToQuery();

  Future<List<Country>> getCountryList() async {

    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql(CustomQuery.countryList),
        ),
      );
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        Map<String, dynamic> jsonMap = jsonDecode(jsonEncode(result.data));
        List<Country> res = Countries.fromJson(jsonMap).countries;
        if (res.isEmpty) {
          return [];
        }
        return res;
      }
    } catch (error) {

      rethrow;
    }
  }
}
