import 'package:another_tcgplayer/catalog/catalog_dto.dart';
import 'package:another_tcgplayer/common/common.dart';
import 'dart:convert';
import 'package:another_tcgplayer/error_models.dart';
import 'package:http/http.dart' as http;

class CatalogService {
  final String baseUrl;
  final bool secure;

  CatalogService({required this.baseUrl, required this.secure});

  ///
  /// This returns a paged list of all categories supported by TCGplayer.
  ///
  Future<TcgPlayerPage<ProductCategoryDto>> listAllCategories(
      {required String authToken, String sortOrder = "Name",
        bool sortDesc = false,
        int offset = 0,
        int limit = 10}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    var params = {
      "offset": offset,
      "limit": limit,
      "sortOrder": sortOrder,
      "sortDesc": sortDesc,
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/categories", params.toQueryParam());
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/categories", params.toQueryParam());
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponsePageDto<ProductCategoryDto> responseDto = TcgPlayerResponsePageDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => ProductCategoryDto.fromJson(data as Map<String, dynamic>));

      return TcgPlayerPage<ProductCategoryDto>(totalItems: responseDto.totalItems, pageItems: responseDto.results);
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message: "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns an array of categories whose Ids were specified in the
  /// categoryIds parameter. Categories that could be found are returned in the results
  /// array in the response. Categories that could not be found are indicated in the
  /// errors array.
  ///
  Future<List<ProductCategoryDto>> getCategoryDetails(
      {required String authToken, required List<int> categoryIds}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint =
          Uri.https(baseUrl, "/catalog/categories/${categoryIds.join(",")}");
    } else {
      endpoint =
          Uri.http(baseUrl, "/catalog/categories/${categoryIds.join(",")}");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<ProductCategoryDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => ProductCategoryDto.fromJson(data as Map<String, dynamic>));

      return responseDto.results;

    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message: "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns a search manifest for the specified category. The search
  /// manifest describes all of the sorting options and filters that are available for
  /// this category. Its contents should be used to build requests to the POST
  /// /catalog/categories/{categoryId}/search endpoint.
  ///
  Future<List<CategorySearchManifestDto>>
      getCategorySearchManifest(
          {required String authToken, required int categoryId}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint =
          Uri.https(baseUrl, "/catalog/categories/$categoryId/search/manifest");
    } else {
      endpoint =
          Uri.http(baseUrl, "/catalog/categories/$categoryId/search/manifest");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategorySearchManifestDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) =>
              CategorySearchManifestDto.fromJson(data as Map<String, dynamic>));

        return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns an array of product Ids that match the provided search critera.
  /// Use the search manifest from the GET /catalog/categories/{categoryId}/search/manifest
  /// endpoint to build requests to this endpoint. If an invalid filter name is specified
  /// in the request, it will be ignored. Use the GET /catalog/products/{productIds}
  /// endpoint to get the details about the returned product Ids.
  ///
  Future<TcgPlayerPage<int>> searchCategoryProducts(
      {required String authToken,
      required int categoryId,
      required CategorySearchRequestDto request}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/categories/$categoryId/search");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/categories/$categoryId/search");
    }

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode(request.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponsePageDto<int> responseListDto = TcgPlayerResponsePageDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => data as int);

      return TcgPlayerPage(totalItems: responseListDto.totalItems, pageItems: responseListDto.results);
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns a paged list of all the groups associated with the specified
  /// category.
  ///
  Future<TcgPlayerPage<CategoryGroupDto>> listAllCategoryGroups(
      {required String authToken,
      required int categoryId,
      int offset = 0,
      int limit = 10}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    var params = {"offset": offset, "limit": limit};
    Uri endpoint;
    if (secure) {
      endpoint =
          Uri.https(baseUrl, "/catalog/categories/$categoryId/groups", params.toQueryParam());
    } else {
      endpoint =
          Uri.http(baseUrl, "/catalog/categories/$categoryId/groups", params.toQueryParam());
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponsePageDto<CategoryGroupDto> responseListDto = TcgPlayerResponsePageDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => CategoryGroupDto.fromJson(data as Map<String, dynamic>));

      return TcgPlayerPage(totalItems: responseListDto.totalItems, pageItems: responseListDto.results);
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns all available rarities associated with the specified category.
  ///
  Future<List<CategoryRarityDto>> listAllCategoryRarities(
      {required String authToken, required int categoryId}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    //var params = {"offset": offset, "limit": limit};
    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/categories/$categoryId/rarities");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/categories/$categoryId/rarities");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryRarityDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => CategoryRarityDto.fromJson(data as Map<String, dynamic>));

      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns all available printings associated with the specified category.
  ///
  Future<List<CategoryPrintingDto>> listAllCategoryPrintings(
      {required String authToken, required int categoryId}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    //var params = {"offset": offset, "limit": limit};
    Uri endpoint;
    if (secure) {
      endpoint =
          Uri.https(baseUrl, "/catalog/categories/$categoryId/printings");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/categories/$categoryId/printings");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryPrintingDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => CategoryPrintingDto.fromJson(data as Map<String, dynamic>));

      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns all available conditions associated with the specified
  /// category.
  ///
  Future<List<CategoryConditionDto>> listAllCategoryConditions(
      {required String authToken, required int categoryId}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    //var params = {"offset": offset, "limit": limit};
    Uri endpoint;
    if (secure) {
      endpoint =
          Uri.https(baseUrl, "/catalog/categories/$categoryId/conditions");
    } else {
      endpoint =
          Uri.http(baseUrl, "/catalog/categories/$categoryId/conditions");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryConditionDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) =>
              CategoryConditionDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns all available languages associated with the specified category.
  ///
  Future<List<CategoryLanguageDto>> listAllCategoryLanguages(
      {required String authToken, required int categoryId}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    //var params = {"offset": offset, "limit": limit};
    Uri endpoint;
    if (secure) {
      endpoint =
          Uri.https(baseUrl, "/catalog/categories/$categoryId/languages");
    } else {
      endpoint =
          Uri.http(baseUrl, "/catalog/categories/$categoryId/languages");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryLanguageDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => CategoryLanguageDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns all available media (e.g. images) associated with the specified
  /// category.
  ///
  Future<List<CategoryMediaDto>> listAllCategoryMedia(
      {required String authToken, required int categoryId}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    //var params = {"offset": offset, "limit": limit};
    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/categories/$categoryId/media");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/categories/$categoryId/media");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryMediaDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => CategoryMediaDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns all groups that match the specified criteria.
  ///
  Future<TcgPlayerPage<CategoryGroupDto>> listAllGroupDetails(
      {required String authToken,
      int? categoryId,
      String? categoryName,
      bool? isSupplemental,
      bool? hasSealed,
      String? sortOrder,
      bool sortDesc = false,
      int offset = 0,
      int limit = 10}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Map<String, String> params = {
      "offset": offset.toString(),
      "limit": limit.toString(),
    };

    if(categoryId != null) {
      params.putIfAbsent("categoryId", () => categoryId.toString());
    }

    if(categoryName != null) {
      params.putIfAbsent("categoryName", () => categoryName.toString());
    }

    if(isSupplemental != null) {
      params.putIfAbsent("isSupplemental", () => isSupplemental.toString());
    }

    if(hasSealed != null) {
      params.putIfAbsent("hasSealed", () => hasSealed.toString());
    }

    if(sortOrder != null) {
      params.putIfAbsent("sortOrder", () => sortOrder.toString());
    }

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/groups", params.toQueryParam());
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/groups", params.toQueryParam());
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponsePageDto<CategoryGroupDto> responseListDto = TcgPlayerResponsePageDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => CategoryGroupDto.fromJson(data as Map<String, dynamic>));
      return TcgPlayerPage(totalItems: responseListDto.totalItems, pageItems: responseListDto.results);
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  /// This endpoint returns an array of groups whose Ids were specified in the groupIds
  /// parameter. Groups that could be found are returned in the results array in the
  /// response. Groups that could not be found are indicated in the errors array.
  ///
  Future<List<CategoryGroupDto>> getGroupDetails(
      {required String authToken, required List<int> groupIds}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/groups/${groupIds.join(",")}");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/groups/${groupIds.join(",")}");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryGroupDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => CategoryGroupDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns all available media (e.g. images) associated with the
  /// specified group.
  ///
  Future<List<CategoryMediaDto>> listAllGroupMedia(
      {required String authToken, required int groupId}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/groups/$groupId/media");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/groups/$groupId/media");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryMediaDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => CategoryMediaDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns all products that match the specified criteria.
  ///
  Future<TcgPlayerPage<ProductDto>> listAllProducts(
      {required String authToken,
      int offset = 0,
      int limit = 10,
      int? categoryId,
      String? categoryName,
      int? groupId,
      String? groupName,
      String? productName,
      bool getExtendedFields = false,
      List<String>? productTypes,
      bool includeSkus = false}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Map<String, String> params = {
      "offset": offset.toString(),
      "limit": limit.toString(),
      "getExtendedFields": getExtendedFields.toString(),
      "includeSkus": includeSkus.toString(),
    };

    if (categoryId != null) {
      params.putIfAbsent("categoryId", () => categoryId.toString());
    }

    if(categoryName != null) {
      params.putIfAbsent("categoryName", () => categoryName);
    }

    if(groupId != null) {
      params.putIfAbsent("groupId", () => groupId.toString());
    }

    if(groupName != null) {
      params.putIfAbsent("groupName", () => groupName);
    }

    if(productName != null) {
      params.putIfAbsent("productName", () => productName);
    }

    if(productTypes != null) {
      params.putIfAbsent("productTypes", () => productTypes.join(","));
    }

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/products", params.toQueryParam());
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/products", params.toQueryParam());
    }

    var response = await http.get(endpoint, headers: headers, );

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponsePageDto<ProductDto> responseListDto = TcgPlayerResponsePageDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
          (data) => ProductDto.fromJson(data as Map<String, dynamic>));
      return TcgPlayerPage(totalItems: responseListDto.totalItems, pageItems: responseListDto.results);
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns an array of products whose Ids were specified in the productIds
  /// parameter. Products that could be found are returned in the results array in the
  /// response. Products that could not be found are indicated in the errors array.
  ///
  Future<List<ProductDto>> getProductDetails(
      {required String authToken,
        required List<int> productIds,
        bool getExtendedFields = false,
        bool includeSkus = false}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    var params = {
      "getExtendedFields": getExtendedFields,
      "includeSkus": includeSkus,
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/products/${productIds.join(",")}", params.toQueryParam());
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/products/${productIds.join(",")}", params.toQueryParam());
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<ProductDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => ProductDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns a Product's details using a code from the GTIN family of
  /// product codes. NOTE: Not all products will have a GTIN.
  ///
  Future<List<ProductDto>> getProductDetailsByGtin(
      {required String authToken,
        required String gtin,
        bool getExtendedFields = false,
        bool includeSkus = false}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    var params = {
      "getExtendedFields": getExtendedFields,
      "includeSkus": includeSkus,
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/products/gtin/$gtin", params.toQueryParam());
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/products/gtin/$gtin", params.toQueryParam());
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<ProductDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => ProductDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }


  ///
  /// This endpoint returns all of the available SKUs for the specified product.
  ///
  Future<List<ProductSkuDto>> listProductSkus(
      {required String authToken,
        required int productId}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/products/$productId/skus");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/products/$productId/skus");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<ProductSkuDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => ProductSkuDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;

    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// Returns other products that are commonly found in the same orders as the specified
  /// anchor product.
  ///
  Future<TcgPlayerPage<RelatedProductDto>> listRelatedProducts(
      {required String authToken,
        required int productId,
        int offset = 0,
        int limit = 10
      }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    var params = {"offset": offset, "limit":limit };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/products/$productId/productsalsopurchased", params.toQueryParam());
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/products/$productId/productsalsopurchased", params.toQueryParam());
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponsePageDto<RelatedProductDto> responseListDto = TcgPlayerResponsePageDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => RelatedProductDto.fromJson(data as Map<String, dynamic>));
      return TcgPlayerPage(totalItems: responseListDto.totalItems, pageItems: responseListDto.results);
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint can be used to return the URL of a product picture.
  /// It makes it so you can display that shiny Charizard on your page more easily.
  /// The product details page will also return an image URL so this endpoint
  /// doesn't need to be called if an application is already calling the Get
  /// Product Details endpoint.
  ///
  Future<List<CategoryMediaDto>> listAllProductMediaType(
      {required String authToken,
        required int productId
      }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/products/$productId/media");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/products/$productId/media");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryMediaDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => CategoryMediaDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns an array of SKUs whose Ids were specified in the skuIds
  /// parameter. SKUs that could be found are returned in the results array in the
  /// response. SKUs that could not be found are indicated in the errors array.
  ///
  Future<List<ProductSkuDto>> getSkuDetails(
      {required String authToken,
        required List<int> skuIds
      }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/skus/${skuIds.join(",")}");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/skus/${skuIds.join(",")}");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<ProductSkuDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => ProductSkuDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns an array contain all of the normalized conditions
  /// supported by TCGplayer, e.g. Near Mint, Lightly Played.
  ///
  Future<List<CategoryConditionDto>> listConditions(
      {required String authToken}) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/catalog/conditions");
    } else {
      endpoint = Uri.http(baseUrl, "/catalog/conditions");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<CategoryConditionDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => CategoryConditionDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw CatalogException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }


}

///
/// Exception related to the Catalog Service
///
class CatalogException implements Exception {
  final String? message;
  final int statusCode;

  CatalogException({required this.statusCode, this.message});

  @override
  String toString() {
    return "CatalogException: $statusCode - $message";
  }
}
