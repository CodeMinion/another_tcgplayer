// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketPriceDto _$MarketPriceDtoFromJson(Map<String, dynamic> json) =>
    MarketPriceDto(
      highestRange: (json['highestRange'] as num).toDouble(),
      lowestRange: (json['lowestRange'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      productConditionId: json['productConditionId'] as int,
    );

Map<String, dynamic> _$MarketPriceDtoToJson(MarketPriceDto instance) =>
    <String, dynamic>{
      'productConditionId': instance.productConditionId,
      'price': instance.price,
      'lowestRange': instance.lowestRange,
      'highestRange': instance.highestRange,
    };

ProductPriceDto _$ProductPriceDtoFromJson(Map<String, dynamic> json) =>
    ProductPriceDto(
      productId: json['productId'] as int,
      directLowPrice: (json['directLowPrice'] as num?)?.toDouble(),
      highPrice: (json['highPrice'] as num?)?.toDouble(),
      lowPrice: (json['lowPrice'] as num?)?.toDouble(),
      marketPrice: (json['marketPrice'] as num?)?.toDouble(),
      midPrice: (json['midPrice'] as num?)?.toDouble(),
      subTypeName: json['subTypeName'] as String,
    );

Map<String, dynamic> _$ProductPriceDtoToJson(ProductPriceDto instance) {
  final val = <String, dynamic>{
    'productId': instance.productId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowPrice', instance.lowPrice);
  writeNotNull('midPrice', instance.midPrice);
  writeNotNull('highPrice', instance.highPrice);
  writeNotNull('marketPrice', instance.marketPrice);
  writeNotNull('directLowPrice', instance.directLowPrice);
  val['subTypeName'] = instance.subTypeName;
  return val;
}

SkuMarketPriceDto _$SkuMarketPriceDtoFromJson(Map<String, dynamic> json) =>
    SkuMarketPriceDto(
      skuId: json['skuId'] as int,
      marketPrice: (json['marketPrice'] as num?)?.toDouble(),
      lowPrice: (json['lowPrice'] as num?)?.toDouble(),
      directLowPrice: (json['directLowPrice'] as num?)?.toDouble(),
      lowestListingPrice: (json['lowestListingPrice'] as num?)?.toDouble(),
      lowestShipping: (json['lowestShipping'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SkuMarketPriceDtoToJson(SkuMarketPriceDto instance) {
  final val = <String, dynamic>{
    'skuId': instance.skuId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lowPrice', instance.lowPrice);
  writeNotNull('lowestShipping', instance.lowestShipping);
  writeNotNull('lowestListingPrice', instance.lowestListingPrice);
  writeNotNull('marketPrice', instance.marketPrice);
  writeNotNull('directLowPrice', instance.directLowPrice);
  return val;
}

BuyPriceDto _$BuyPriceDtoFromJson(Map<String, dynamic> json) => BuyPriceDto(
      high: (json['high'] as num?)?.toDouble(),
      market: (json['market'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BuyPriceDtoToJson(BuyPriceDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('high', instance.high);
  writeNotNull('market', instance.market);
  return val;
}

SkuBuyPriceDto _$SkuBuyPriceDtoFromJson(Map<String, dynamic> json) =>
    SkuBuyPriceDto(
      skuId: json['skuId'] as int,
      prices: BuyPriceDto.fromJson(json['prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SkuBuyPriceDtoToJson(SkuBuyPriceDto instance) =>
    <String, dynamic>{
      'skuId': instance.skuId,
      'prices': instance.prices,
    };

BuylistPriceDto _$BuylistPriceDtoFromJson(Map<String, dynamic> json) =>
    BuylistPriceDto(
      prices: BuyPriceDto.fromJson(json['prices'] as Map<String, dynamic>),
      productId: json['productId'] as int,
      skus: (json['skus'] as List<dynamic>)
          .map((e) => SkuBuyPriceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuylistPriceDtoToJson(BuylistPriceDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'prices': instance.prices,
      'skus': instance.skus,
    };
