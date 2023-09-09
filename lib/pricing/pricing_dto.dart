
import 'package:json_annotation/json_annotation.dart';

part 'pricing_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class MarketPriceDto {

  int productConditionId;
  double price;
  double lowestRange;
  double highestRange;

  MarketPriceDto({required this.highestRange, required this.lowestRange, required this.price, required this.productConditionId});

  factory MarketPriceDto.fromJson(Map<String, dynamic> json) =>
      _$MarketPriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MarketPriceDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProductPriceDto {
  int productId;
  double? lowPrice;
  double? midPrice;
  double? highPrice;
  double? marketPrice;
  double? directLowPrice;
  String subTypeName;

  ProductPriceDto({required this.productId, this.directLowPrice, this.highPrice, this.lowPrice, this.marketPrice, this.midPrice, required this.subTypeName});

  factory ProductPriceDto.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPriceDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class SkuMarketPriceDto {
  int skuId;
  double? lowPrice;
  double? lowestShipping;
  double? lowestListingPrice;
  double? marketPrice;
  double? directLowPrice;

  SkuMarketPriceDto({required this.skuId, this.marketPrice, this.lowPrice, this.directLowPrice, this.lowestListingPrice, this.lowestShipping});

  factory SkuMarketPriceDto.fromJson(Map<String, dynamic> json) =>
      _$SkuMarketPriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SkuMarketPriceDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class BuyPriceDto {

  double? high;
  double? market;

  BuyPriceDto({this.high, this.market});

  factory BuyPriceDto.fromJson(Map<String, dynamic> json) =>
      _$BuyPriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPriceDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class SkuBuyPriceDto {

  int skuId;
  BuyPriceDto prices;

  SkuBuyPriceDto({required this.skuId, required this.prices});

  factory SkuBuyPriceDto.fromJson(Map<String, dynamic> json) =>
      _$SkuBuyPriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SkuBuyPriceDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class BuylistPriceDto {
  int productId;
  BuyPriceDto prices;
  List<SkuBuyPriceDto> skus;

  BuylistPriceDto({required this.prices, required this.productId, required this.skus});

  factory BuylistPriceDto.fromJson(Map<String, dynamic> json) =>
      _$BuylistPriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BuylistPriceDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}