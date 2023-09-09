library another_tcgplayer;

import 'package:another_tcgplayer/auth/auth_dto.dart';
import 'package:another_tcgplayer/auth/auth_service.dart';
import 'package:another_tcgplayer/catalog/catalog_dto.dart';
import 'package:another_tcgplayer/catalog/catalog_service.dart';
import 'package:another_tcgplayer/common/common.dart';
import 'package:another_tcgplayer/pricing/pricing_dto.dart';
import 'package:another_tcgplayer/pricing/pricing_service.dart';

/// A Calculator.
class TcgPlayerClient {
  final String _baseUrl;
  final String _publicKey;
  final String _privateKey;
  final bool _secured = true;

  AccessToken? _accessToken;
  late AuthService _authService;
  late CatalogService _catalogService;
  late PricingService _pricingService;

  TcgPlayerClient(
      {required String publicKey,
      required String privateKey,
      String baseUrl = "api.tcgplayer.com"})
      : _baseUrl = baseUrl,
        _publicKey = publicKey,
        _privateKey = privateKey {
    _authService = AuthService(baseUrl: baseUrl, secure: _secured);
    _catalogService = CatalogService(baseUrl: _baseUrl, secure: _secured);
    _pricingService = PricingService(baseUrl: _baseUrl, secure: _secured);
  }

  Future<AccessToken> authorize() async {
    AccessToken token = await _authService.authorize(
        publicKey: _publicKey, privateKey: _privateKey);
    _accessToken = _accessToken;
    return token;
  }

  bool isAuthorized() {
    return _accessToken != null && !_accessToken!.isExpired();
  }

  ///
  /// This returns a paged list of all categories supported by TCGplayer.
  ///
  Future<TcgPlayerPage<ProductCategoryDto>> listAllCategories(
      {String sortOrder = "Name",
      bool sortDesc = false,
      int offset = 0,
      int limit = 10}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllCategories(
        authToken: _accessToken!.accessToken,
        sortDesc: sortDesc,
        sortOrder: sortOrder,
        offset: offset,
        limit: limit);
  }

  ///
  /// This endpoint returns an array of categories whose Ids were specified in the
  /// categoryIds parameter. Categories that could be found are returned in the results
  /// array in the response. Categories that could not be found are indicated in the
  /// errors array.
  ///
  Future<List<ProductCategoryDto>> getCategoryDetails(
      {required List<int> categoryIds}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.getCategoryDetails(
        authToken: _accessToken!.accessToken, categoryIds: categoryIds);
  }

  ///
  /// This endpoint returns a search manifest for the specified category. The search
  /// manifest describes all of the sorting options and filters that are available for
  /// this category. Its contents should be used to build requests to the POST
  /// /catalog/categories/{categoryId}/search endpoint.
  ///
  Future<List<CategorySearchManifestDto>> getCategorySearchManifest(
      {required int categoryId}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.getCategorySearchManifest(
        authToken: _accessToken!.accessToken, categoryId: categoryId);
  }

  ///
  /// This endpoint returns an array of product Ids that match the provided search critera.
  /// Use the search manifest from the GET /catalog/categories/{categoryId}/search/manifest
  /// endpoint to build requests to this endpoint. If an invalid filter name is specified
  /// in the request, it will be ignored. Use the GET /catalog/products/{productIds}
  /// endpoint to get the details about the returned product Ids.
  ///
  Future<TcgPlayerPage<int>> searchCategoryProducts(
      {required int categoryId,
      required CategorySearchRequestDto request}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }
    return _catalogService.searchCategoryProducts(
        authToken: _accessToken!.accessToken,
        categoryId: categoryId,
        request: request);
  }

  ///
  /// This endpoint returns a paged list of all the groups associated with the specified
  /// category.
  ///
  Future<TcgPlayerPage<CategoryGroupDto>> listAllCategoryGroups(
      {required int categoryId, int offset = 0, int limit = 10}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllCategoryGroups(
        authToken: _accessToken!.accessToken,
        categoryId: categoryId,
        limit: limit,
        offset: offset);
  }

  ///
  /// This endpoint returns all available rarities associated with the specified category.
  ///
  Future<List<CategoryRarityDto>> listAllCategoryRarities(
      {required int categoryId}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllCategoryRarities(
        authToken: _accessToken!.accessToken, categoryId: categoryId);
  }

  ///
  /// This endpoint returns all available printings associated with the specified category.
  ///
  Future<List<CategoryPrintingDto>> listAllCategoryPrintings(
      {required int categoryId}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllCategoryPrintings(
        authToken: _accessToken!.accessToken, categoryId: categoryId);
  }

  ///
  /// This endpoint returns all available conditions associated with the specified
  /// category.
  ///
  Future<List<CategoryConditionDto>> listAllCategoryConditions(
      {required int categoryId}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllCategoryConditions(
        authToken: _accessToken!.accessToken, categoryId: categoryId);
  }

  ///
  /// This endpoint returns all available languages associated with the specified category.
  ///
  Future<List<CategoryLanguageDto>> listAllCategoryLanguages(
      {required int categoryId}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllCategoryLanguages(
        authToken: _accessToken!.accessToken, categoryId: categoryId);
  }

  ///
  /// This endpoint returns all available media (e.g. images) associated with the specified
  /// category.
  ///
  Future<List<CategoryMediaDto>> listAllCategoryMedia(
      {required int categoryId}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllCategoryMedia(
        authToken: _accessToken!.accessToken, categoryId: categoryId);
  }

  ///
  /// This endpoint returns all groups that match the specified criteria.
  ///
  Future<TcgPlayerPage<CategoryGroupDto>> listAllGroupDetails(
      {int? categoryId,
      String? categoryName,
      bool? isSupplemental,
      bool? hasSealed,
      String? sortOrder,
      bool sortDesc = false,
      int offset = 0,
      int limit = 10}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllGroupDetails(
        authToken: _accessToken!.accessToken,
        categoryId: categoryId,
        categoryName: categoryName,
        isSupplemental: isSupplemental,
        hasSealed: hasSealed,
        sortOrder: sortOrder,
        sortDesc: sortDesc,
        offset: offset,
        limit: limit);
  }

  /// This endpoint returns an array of groups whose Ids were specified in the groupIds
  /// parameter. Groups that could be found are returned in the results array in the
  /// response. Groups that could not be found are indicated in the errors array.
  ///
  Future<List<CategoryGroupDto>> getGroupDetails(
      {required List<int> groupIds}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.getGroupDetails(
        authToken: _accessToken!.accessToken, groupIds: groupIds);
  }

  ///
  /// This endpoint returns all available media (e.g. images) associated with the
  /// specified group.
  ///
  Future<List<CategoryMediaDto>> listAllGroupMedia(
      {required int groupId}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllGroupMedia(
        authToken: _accessToken!.accessToken, groupId: groupId);
  }

  ///
  /// This endpoint returns all products that match the specified criteria.
  ///
  Future<TcgPlayerPage<ProductDto>> listAllProducts(
      {int offset = 0,
      int limit = 10,
      int? categoryId,
      String? categoryName,
      int? groupId,
      String? groupName,
      String? productName,
      bool? getExtendedFields,
      List<String>? productTypes,
      bool? includeSkus}) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllProducts(
        authToken: _accessToken!.accessToken,
        offset: offset,
        limit: limit,
        categoryId: categoryId,
        categoryName: categoryName,
        groupId: groupId,
        groupName: groupName,
        productName: productName,
        getExtendedFields: getExtendedFields ?? false,
        productTypes: productTypes,
        includeSkus: includeSkus ?? false);
  }

  ///
  /// This endpoint returns an array of products whose Ids were specified in the productIds
  /// parameter. Products that could be found are returned in the results array in the
  /// response. Products that could not be found are indicated in the errors array.
  ///
  Future<List<ProductDto>> getProductDetails(
      {required List<int> productIds,
        bool getExtendedFields = false,
        bool includeSkus = false}) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.getProductDetails(authToken: _accessToken!.accessToken, productIds: productIds);
  }

  ///
  /// This endpoint returns a Product's details using a code from the GTIN family of
  /// product codes. NOTE: Not all products will have a GTIN.
  ///
  Future<List<ProductDto>> getProductDetailsByGtin(
      {required String gtin,
        bool getExtendedFields = false,
        bool includeSkus = false}) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.getProductDetailsByGtin(authToken: _accessToken!.accessToken, gtin: gtin);
  }

  ///
  /// This endpoint returns all of the available SKUs for the specified product.
  ///
  Future<List<ProductSkuDto>> listProductSkus(
      {required int productId}) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listProductSkus(authToken: _accessToken!.accessToken, productId: productId);
  }

  ///
  /// Returns other products that are commonly found in the same orders as the specified
  /// anchor product.
  ///
  Future<TcgPlayerPage<RelatedProductDto>> listRelatedProducts(
      {required int productId,
        int offset = 0,
        int limit = 10
      }) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listRelatedProducts(authToken: _accessToken!.accessToken, productId: productId);
  }


  ///
  /// This endpoint can be used to return the URL of a product picture.
  /// It makes it so you can display that shiny Charizard on your page more easily.
  /// The product details page will also return an image URL so this endpoint
  /// doesn't need to be called if an application is already calling the Get
  /// Product Details endpoint.
  ///
  Future<List<CategoryMediaDto>> listAllProductMediaType(
      { required int productId
      }) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listAllProductMediaType(authToken: _accessToken!.accessToken, productId: productId);
  }

  ///
  /// This endpoint returns an array of SKUs whose Ids were specified in the skuIds
  /// parameter. SKUs that could be found are returned in the results array in the
  /// response. SKUs that could not be found are indicated in the errors array.
  ///
  Future<List<ProductSkuDto>> getSkuDetails(
      {required List<int> skuIds
      }) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.getSkuDetails(authToken: _accessToken!.accessToken, skuIds: skuIds);

  }

  ///
  /// This endpoint returns an array contain all of the normalized conditions
  /// supported by TCGplayer, e.g. Near Mint, Lightly Played.
  ///
  Future<List<CategoryConditionDto>> listConditions(
      ) async {
    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _catalogService.listConditions(authToken: _accessToken!.accessToken);
  }

  //////////

  ///
  /// This endpoint will return the Market Price for a single SKU.
  /// SKUs are also commonly referred to as "productConditionId" in the API.
  /// Unlike many endpoints in the API, this endpoint does not work
  /// with a comma-separated list of SKUs.
  ///
  Future<List<MarketPriceDto>> getMarketPriceBySku(
      {required int productConditionId
      }) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _pricingService.getMarketPriceBySku(authToken: _accessToken!.accessToken, productConditionId: productConditionId);
  }

  ///
  /// This will return all of the pricing for a specific product group.
  /// Many products in our catalog refer to their individual groups as a "set".
  ///
  Future<List<ProductPriceDto>> getProductPricesByGroup(
      { required int groupId}) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _pricingService.getProductPricesByGroup(authToken: _accessToken!.accessToken, groupId: groupId);

  }

  ///
  /// This endpoint accepts a comma-separated list of product ids.
  /// A good workflow can be to first hit the product search endpoint and
  /// then from there hit pricing from the list of ids.
  ///
  Future<List<ProductPriceDto>> listProductMarketPrices(
      {required List<int> productIds}) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

   return _pricingService.listProductMarketPrices(authToken: _accessToken!.accessToken, productIds: productIds);
  }

  ///
  /// This endpoint returns pricing for a comma-separated list of product SKUs.
  /// SKU is also referred to as "productConditionId" by some endpoints.
  /// If a specific pricing is returned as a null value it means there
  /// are currently no versions of that product at that condition listed
  /// on TCGplayer.
  ///
  Future<List<SkuMarketPriceDto>> listSkusMarketPrices(
      {required List<int> skuIds
      }) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _pricingService.listSkusMarketPrices(authToken: _accessToken!.accessToken, skuIds: skuIds);
  }

  ///
  /// This endpoint breaks down pricing data by SKU,
  /// which means it returns pricing for different conditions
  /// of a specific product.
  ///
  Future<List<BuylistPriceDto>> listProductBuylistPrices(
      {required List<int> productIds
      }) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _pricingService.listProductBuylistPrices(authToken: _accessToken!.accessToken, productIds: productIds);
  }

  ///
  /// Returns Buylist pricing for specific conditions.
  /// If data isn't found for a specific type of Buylist price
  /// there will be null fields.
  ///
  Future<List<SkuBuyPriceDto>> listSkuBuylistPrices(
      {required List<int> skuIds
      }) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }
    return _pricingService.listSkuBuylistPrices(authToken: _accessToken!.accessToken, skuIds: skuIds);
  }

  ///
  /// Returns all product buylist prices associated with the specified Group.
  ///
  Future<List<BuylistPriceDto>> listProductBuylistPricesByGroup(
      {required int groupId}) async {

    if ((!isAuthorized())) {
      AccessToken token = await _authService.authorize(
          publicKey: _publicKey, privateKey: _privateKey);
      _accessToken = token;
    }

    return _pricingService.listProductBuylistPricesByGroup(authToken: _accessToken!.accessToken, groupId: groupId);
  }
}

