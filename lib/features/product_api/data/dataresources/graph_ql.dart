import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQl {
  final HttpLink httpLink = HttpLink('https://imake-app.com:4111/graphql');
  final AuthLink authLink = AuthLink(getToken: () {
    return 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NTBhMDgxMWNjZGQwODg0NjY5NmZlMjIiLCJpYXQiOjE2OTY3MDQwODgsImF1ZCI6IlBvc3RtYW5SdW50aW1lLzcuMzMuMCIsImlzcyI6Ik1ha2VBcHAiLCJzdWIiOiJzb21lQHVzZXIuY29tIn0.dqyl8HH3jhyj3YgbLxes6i3Ju5s1gmqM8cUSyLdIkzDGqEsw_zOaGLjKj-VvEFKcd6Tu-8AwpD4ipxSx7945gtXpZzXd-2s0IfHXhEMebrAVZHasp1GSQgJGIUkezxXhbbG_uleTB6E7u0KV2UcGlo592_-X0UH0myAdGAjv4COC-Ym-3T6sItuIE6Ap74-xyhzOgQRu2VSuU0nTLtZDyogBm_kxc_DEcI9-fPHAeBA2MmoPqiIL57mKlZpuoRrF_1TBEu9XrZX3prRYLuz0zQR3UD932GnpHks2U9QFiciXFGzH-r3xT18P1EldU9rlrv_8kVcND846W8wB6Kr_Tg';
  });

  Future<Map<String, dynamic>?> getData({
    String? categoryId, 
  }) async {
    final Link link = authLink.concat(httpLink);
    final GraphQLClient client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );

    final QueryOptions options = QueryOptions(
      document: gql('''
          query GetProducts() {
            products(Function: "Filters",
           
            ) {
              id
              name_ar
              name_en
              admin_comment
              attributes {
                id
              }
              category {
                name_ar
                id
              }
            }
          }
        '''),
      variables:  {
        'category_id': "$categoryId" ,
        'price_from': '',
        'price_to': '',
        'rate_from': '',
        'rate_to': '',
        'spacefications': const [],
        'attributes': const [],
        'brand_id': const [],
        'name': '',
        'vendor_id': 460,
      },
    );

    final QueryResult result = await client.query(
      options,
    );

    final Map<String, dynamic>? responseMap = result.data;
    return responseMap;
  }
}
