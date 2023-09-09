// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryDto _$ProductCategoryDtoFromJson(Map<String, dynamic> json) =>
    ProductCategoryDto(
      categoryId: json['categoryId'] as int,
      name: json['name'] as String,
      modifiedOn: json['modifiedOn'] as String,
      displayName: json['displayName'] as String,
      seoCategoryName: json['seoCategoryName'] as String,
      conditionGuideUrl: json['conditionGuideUrl'] as String,
      isScannable: json['isScannable'] as bool,
      nonSealedLabel: json['nonSealedLabel'] as String,
      popularity: json['popularity'] as int,
      sealedLabel: json['sealedLabel'] as String,
    );

Map<String, dynamic> _$ProductCategoryDtoToJson(ProductCategoryDto instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
      'modifiedOn': instance.modifiedOn,
      'displayName': instance.displayName,
      'seoCategoryName': instance.seoCategoryName,
      'sealedLabel': instance.sealedLabel,
      'nonSealedLabel': instance.nonSealedLabel,
      'conditionGuideUrl': instance.conditionGuideUrl,
      'isScannable': instance.isScannable,
      'popularity': instance.popularity,
    };

TcgPlayerField _$TcgPlayerFieldFromJson(Map<String, dynamic> json) =>
    TcgPlayerField(
      text: json['text'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$TcgPlayerFieldToJson(TcgPlayerField instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };

CategoryFilter _$CategoryFilterFromJson(Map<String, dynamic> json) =>
    CategoryFilter(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => TcgPlayerField.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputType: json['inputType'] as String,
    );

Map<String, dynamic> _$CategoryFilterToJson(CategoryFilter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'inputType': instance.inputType,
      'items': instance.items,
    };

ProductFilter _$ProductFilterFromJson(Map<String, dynamic> json) =>
    ProductFilter(
      name: json['name'] as String,
      values:
          (json['values'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductFilterToJson(ProductFilter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };

CategoryGroupDto _$CategoryGroupDtoFromJson(Map<String, dynamic> json) =>
    CategoryGroupDto(
      name: json['name'] as String,
      modifiedOn: json['modifiedOn'] as String,
      categoryId: json['categoryId'] as int,
      abbreviation: json['abbreviation'] as String,
      groupId: json['groupId'] as int,
      isSupplemental: json['isSupplemental'] as bool,
      publishedOn: json['publishedOn'] as String,
    );

Map<String, dynamic> _$CategoryGroupDtoToJson(CategoryGroupDto instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'name': instance.name,
      'abbreviation': instance.abbreviation,
      'isSupplemental': instance.isSupplemental,
      'publishedOn': instance.publishedOn,
      'modifiedOn': instance.modifiedOn,
      'categoryId': instance.categoryId,
    };

CategoryRarityDto _$CategoryRarityDtoFromJson(Map<String, dynamic> json) =>
    CategoryRarityDto(
      rarityId: json['rarityId'] as int,
      displayText: json['displayText'] as String,
      dbValue: json['dbValue'] as String,
    );

Map<String, dynamic> _$CategoryRarityDtoToJson(CategoryRarityDto instance) =>
    <String, dynamic>{
      'rarityId': instance.rarityId,
      'displayText': instance.displayText,
      'dbValue': instance.dbValue,
    };

CategoryPrintingDto _$CategoryPrintingDtoFromJson(Map<String, dynamic> json) =>
    CategoryPrintingDto(
      modifiedOn: json['modifiedOn'] as String,
      name: json['name'] as String,
      displayOrder: json['displayOrder'] as int,
      printingId: json['printingId'] as int,
    );

Map<String, dynamic> _$CategoryPrintingDtoToJson(
        CategoryPrintingDto instance) =>
    <String, dynamic>{
      'printingId': instance.printingId,
      'name': instance.name,
      'displayOrder': instance.displayOrder,
      'modifiedOn': instance.modifiedOn,
    };

CategoryConditionDto _$CategoryConditionDtoFromJson(
        Map<String, dynamic> json) =>
    CategoryConditionDto(
      conditionId: json['conditionId'] as int,
      name: json['name'] as String,
      displayOrder: json['displayOrder'] as int,
      abbreviation: json['abbreviation'] as String,
    );

Map<String, dynamic> _$CategoryConditionDtoToJson(
        CategoryConditionDto instance) =>
    <String, dynamic>{
      'conditionId': instance.conditionId,
      'name': instance.name,
      'abbreviation': instance.abbreviation,
      'displayOrder': instance.displayOrder,
    };

CategoryLanguageDto _$CategoryLanguageDtoFromJson(Map<String, dynamic> json) =>
    CategoryLanguageDto(
      name: json['name'] as String,
      abbr: json['abbr'] as String,
      languageId: json['languageId'] as int,
    );

Map<String, dynamic> _$CategoryLanguageDtoToJson(
        CategoryLanguageDto instance) =>
    <String, dynamic>{
      'languageId': instance.languageId,
      'name': instance.name,
      'abbr': instance.abbr,
    };

CategoryMediaItemDto _$CategoryMediaItemDtoFromJson(
        Map<String, dynamic> json) =>
    CategoryMediaItemDto(
      displayOrder: json['displayOrder'] as int,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CategoryMediaItemDtoToJson(
        CategoryMediaItemDto instance) =>
    <String, dynamic>{
      'url': instance.url,
      'displayOrder': instance.displayOrder,
    };

CategoryMediaDto _$CategoryMediaDtoFromJson(Map<String, dynamic> json) =>
    CategoryMediaDto(
      mediaType: json['mediaType'] as String,
      contentList: (json['contentList'] as List<dynamic>)
          .map((e) => CategoryMediaItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryMediaDtoToJson(CategoryMediaDto instance) =>
    <String, dynamic>{
      'mediaType': instance.mediaType,
      'contentList': instance.contentList,
    };

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      url: json['url'] as String,
      name: json['name'] as String,
      modifiedOn: json['modifiedOn'] as String,
      groupId: json['groupId'] as int,
      categoryId: json['categoryId'] as int,
      imageUrl: json['imageUrl'] as String,
      cleanName: json['cleanName'] as String,
      productId: json['productId'] as int,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'cleanName': instance.cleanName,
      'imageUrl': instance.imageUrl,
      'categoryId': instance.categoryId,
      'groupId': instance.groupId,
      'url': instance.url,
      'modifiedOn': instance.modifiedOn,
    };

ProductSkuDto _$ProductSkuDtoFromJson(Map<String, dynamic> json) =>
    ProductSkuDto(
      languageId: json['languageId'] as int,
      conditionId: json['conditionId'] as int,
      printingId: json['printingId'] as int,
      productId: json['productId'] as int,
      skuId: json['skuId'] as int,
    );

Map<String, dynamic> _$ProductSkuDtoToJson(ProductSkuDto instance) =>
    <String, dynamic>{
      'skuId': instance.skuId,
      'productId': instance.productId,
      'languageId': instance.languageId,
      'printingId': instance.printingId,
      'conditionId': instance.conditionId,
    };

RelatedProductDto _$RelatedProductDtoFromJson(Map<String, dynamic> json) =>
    RelatedProductDto(
      addedDt: json['addedDt'] as String,
      cardId: json['cardId'] as int,
      cleanSetName: json['cleanSetName'] as String,
      lowestPrice: (json['lowestPrice'] as num).toDouble(),
      productName: json['productName'] as String,
      purchasedCount: json['purchasedCount'] as int,
      purchasedProductCleanName: json['purchasedProductCleanName'] as String,
      purchasedProductName: json['purchasedProductName'] as String,
      purchasedStoreProductId: json['purchasedStoreProductId'] as int,
      setName: json['setName'] as String,
      usesCdn: json['usesCdn'] as bool,
    );

Map<String, dynamic> _$RelatedProductDtoToJson(RelatedProductDto instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'setName': instance.setName,
      'cleanSetName': instance.cleanSetName,
      'productName': instance.productName,
      'purchasedProductName': instance.purchasedProductName,
      'purchasedProductCleanName': instance.purchasedProductCleanName,
      'purchasedCount': instance.purchasedCount,
      'lowestPrice': instance.lowestPrice,
      'purchasedStoreProductId': instance.purchasedStoreProductId,
      'addedDt': instance.addedDt,
      'usesCdn': instance.usesCdn,
    };

TcgPlayerResponse _$TcgPlayerResponseFromJson(Map<String, dynamic> json) =>
    TcgPlayerResponse(
      success: json['success'] as bool,
      errors:
          (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TcgPlayerResponseToJson(TcgPlayerResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'errors': instance.errors,
    };

CategorySearchManifestDto _$CategorySearchManifestDtoFromJson(
        Map<String, dynamic> json) =>
    CategorySearchManifestDto(
      filters: (json['filters'] as List<dynamic>)
          .map((e) => CategoryFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      sorting: (json['sorting'] as List<dynamic>)
          .map((e) => TcgPlayerField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategorySearchManifestDtoToJson(
        CategorySearchManifestDto instance) =>
    <String, dynamic>{
      'sorting': instance.sorting,
      'filters': instance.filters,
    };

CategorySearchRequestDto _$CategorySearchRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CategorySearchRequestDto(
      filters: (json['filters'] as List<dynamic>)
          .map((e) => ProductFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] as int,
      offset: json['offset'] as int,
      sort: json['sort'] as String,
    );

Map<String, dynamic> _$CategorySearchRequestDtoToJson(
        CategorySearchRequestDto instance) =>
    <String, dynamic>{
      'sort': instance.sort,
      'limit': instance.limit,
      'offset': instance.offset,
      'filters': instance.filters,
    };
