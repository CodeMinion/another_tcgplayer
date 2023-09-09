
import 'package:another_tcgplayer/common/common.dart';
import 'dart:convert';
import 'package:another_tcgplayer/error_models.dart';
import 'package:another_tcgplayer/pricing/pricing_dto.dart';
import 'package:http/http.dart' as http;

class PricingService {
  final String baseUrl;
  final bool secure;

  PricingService({required this.baseUrl, required this.secure});


  ///
  /// This endpoint will return the Market Price for a single SKU.
  /// SKUs are also commonly referred to as "productConditionId" in the API.
  /// Unlike many endpoints in the API, this endpoint does not work
  /// with a comma-separated list of SKUs.
  ///
  Future<List<MarketPriceDto>> getMarketPriceBySku(
      {required String authToken,
        required int productConditionId
      }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/pricing/marketprices/$productConditionId");
    } else {
      endpoint = Uri.http(baseUrl, "/pricing/marketprices/$productConditionId");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<MarketPriceDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => MarketPriceDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw PricingException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This will return all of the pricing for a specific product group.
  /// Many products in our catalog refer to their individual groups as a "set".
  ///
  Future<List<ProductPriceDto>> getProductPricesByGroup(
      {required String authToken,
        required int groupId
      }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/pricing/group/$groupId");
    } else {
      endpoint = Uri.http(baseUrl, "/pricing/group/$groupId");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<ProductPriceDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => ProductPriceDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw PricingException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint accepts a comma-separated list of product ids.
  /// A good workflow can be to first hit the product search endpoint and
  /// then from there hit pricing from the list of ids.
  ///
  Future<List<ProductPriceDto>> listProductMarketPrices(
      {required String authToken,
        required List<int> productIds
      }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/pricing/product/${productIds.join(",")}");
    } else {
      endpoint = Uri.http(baseUrl, "/pricing/product/${productIds.join(",")}");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<ProductPriceDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => ProductPriceDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw PricingException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint returns pricing for a comma-separated list of product SKUs.
  /// SKU is also referred to as "productConditionId" by some endpoints.
  /// If a specific pricing is returned as a null value it means there
  /// are currently no versions of that product at that condition listed
  /// on TCGplayer.
  ///
  Future<List<SkuMarketPriceDto>> listSkusMarketPrices(
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
      endpoint = Uri.https(baseUrl, "/pricing/sku/${skuIds.join(",")}");
    } else {
      endpoint = Uri.http(baseUrl, "/pricing/sku/${skuIds.join(",")}");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<SkuMarketPriceDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => SkuMarketPriceDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw PricingException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// This endpoint breaks down pricing data by SKU,
  /// which means it returns pricing for different conditions
  /// of a specific product.
  ///
  Future<List<BuylistPriceDto>> listProductBuylistPrices(
      {required String authToken,
        required List<int> productIds
      }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/pricing/buy/product/${productIds.join(",")}");
    } else {
      endpoint = Uri.http(baseUrl, "/pricing/buy/product/${productIds.join(",")}");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<BuylistPriceDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => BuylistPriceDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw PricingException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// Returns Buylist pricing for specific conditions.
  /// If data isn't found for a specific type of Buylist price
  /// there will be null fields.
  ///
  Future<List<SkuBuyPriceDto>> listSkuBuylistPrices(
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
      endpoint = Uri.https(baseUrl, "/pricing/buy/sku/${skuIds.join(",")}");
    } else {
      endpoint = Uri.http(baseUrl, "/pricing/buy/sku/${skuIds.join(",")}");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<SkuBuyPriceDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => SkuBuyPriceDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw PricingException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }

  ///
  /// Returns all product buylist prices associated with the specified Group.
  ///
  Future<List<BuylistPriceDto>> listProductBuylistPricesByGroup(
      {required String authToken,
        required int groupId
      }) async {
    Map<String, String> headers = {
      "Authorization": "Bearer $authToken",
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    };

    Uri endpoint;
    if (secure) {
      endpoint = Uri.https(baseUrl, "/pricing/buy/group/$groupId");
    } else {
      endpoint = Uri.http(baseUrl, "/pricing/buy/group/$groupId");
    }

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      TcgPlayerResponseDto<BuylistPriceDto> responseDto = TcgPlayerResponseDto.fromJson(
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes)),
              (data) => BuylistPriceDto.fromJson(data as Map<String, dynamic>));
      return responseDto.results;
    } else {
      var error = ServerError.fromJson(jsonDecode(response.body));
      throw PricingException(
          statusCode: response.statusCode, message:  "${error.error} - ${error.errorDescription}");
    }
  }


}

///
/// Exception related to the Pricing Service
///
class PricingException implements Exception {
  final String? message;
  final int statusCode;

  PricingException({required this.statusCode, this.message});

  @override
  String toString() {
    return "PricingException: $statusCode - $message";
  }
}
