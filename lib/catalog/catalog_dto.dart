import 'package:json_annotation/json_annotation.dart';

part 'catalog_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class ProductCategoryDto {
  int categoryId;
  String name;
  String modifiedOn;
  String displayName;
  String seoCategoryName;
  String sealedLabel;
  String nonSealedLabel;
  String conditionGuideUrl;
  bool isScannable;
  int popularity;

  ProductCategoryDto(
      {required this.categoryId,
      required this.name,
      required this.modifiedOn,
      required this.displayName,
      required this.seoCategoryName,
      required this.conditionGuideUrl,
      required this.isScannable,
      required this.nonSealedLabel,
      required this.popularity,
      required this.sealedLabel});

  factory ProductCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class TcgPlayerField {
  String text;
  String value;

  TcgPlayerField({required this.text, required this.value});

  factory TcgPlayerField.fromJson(Map<String, dynamic> json) =>
      _$TcgPlayerFieldFromJson(json);

  Map<String, dynamic> toJson() => _$TcgPlayerFieldToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategoryFilter {
  String name;
  String displayName;
  String inputType;

  List<TcgPlayerField> items;

  CategoryFilter(
      {required this.name,
      required this.displayName,
      required this.items,
      required this.inputType});

  factory CategoryFilter.fromJson(Map<String, dynamic> json) =>
      _$CategoryFilterFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryFilterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProductFilter {
  String name;
  List<String> values;

  ProductFilter({required this.name, required this.values});

  factory ProductFilter.fromJson(Map<String, dynamic> json) =>
      _$ProductFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFilterToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategoryGroupDto {
  int groupId;
  String name;
  String abbreviation;
  bool isSupplemental;
  String publishedOn;
  String modifiedOn;
  int categoryId;

  CategoryGroupDto(
      {required this.name,
      required this.modifiedOn,
      required this.categoryId,
      required this.abbreviation,
      required this.groupId,
      required this.isSupplemental,
      required this.publishedOn});

  factory CategoryGroupDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryGroupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryGroupDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategoryRarityDto {
  int rarityId;
  String displayText;
  String dbValue;

  CategoryRarityDto(
      {required this.rarityId,
      required this.displayText,
      required this.dbValue});

  factory CategoryRarityDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryRarityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryRarityDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategoryPrintingDto {
  int printingId;
  String name;
  int displayOrder;
  String modifiedOn;

  CategoryPrintingDto(
      {required this.modifiedOn,
      required this.name,
      required this.displayOrder,
      required this.printingId});

  factory CategoryPrintingDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryPrintingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryPrintingDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategoryConditionDto {
  int conditionId;
  String name;
  String abbreviation;
  int displayOrder;

  CategoryConditionDto(
      {required this.conditionId,
      required this.name,
      required this.displayOrder,
      required this.abbreviation});

  factory CategoryConditionDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryConditionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryConditionDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategoryLanguageDto {
  int languageId;
  String name;
  String abbr;

  CategoryLanguageDto(
      {required this.name, required this.abbr, required this.languageId});

  factory CategoryLanguageDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryLanguageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryLanguageDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategoryMediaItemDto {
  String url;
  int displayOrder;

  CategoryMediaItemDto({required this.displayOrder, required this.url});

  factory CategoryMediaItemDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryMediaItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMediaItemDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategoryMediaDto {
  String mediaType;
  List<CategoryMediaItemDto> contentList;

  CategoryMediaDto({required this.mediaType, required this.contentList});

  factory CategoryMediaDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryMediaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMediaDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProductDto {
  int productId;
  String name;
  String cleanName;
  String imageUrl;
  int categoryId;
  int groupId;
  String url;
  String modifiedOn;

  ProductDto(
      {required this.url,
      required this.name,
      required this.modifiedOn,
      required this.groupId,
      required this.categoryId,
      required this.imageUrl,
      required this.cleanName,
      required this.productId});

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class ProductSkuDto {
  int skuId;
  int productId;
  int languageId;
  int printingId;
  int conditionId;

  ProductSkuDto(
      {required this.languageId,
      required this.conditionId,
      required this.printingId,
      required this.productId,
      required this.skuId});

  factory ProductSkuDto.fromJson(Map<String, dynamic> json) =>
      _$ProductSkuDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSkuDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class RelatedProductDto {
  int cardId;
  String setName;
  String cleanSetName;
  String productName;
  String purchasedProductName;
  String purchasedProductCleanName;
  int purchasedCount;
  double lowestPrice;
  int purchasedStoreProductId;
  String addedDt;
  bool usesCdn;

  RelatedProductDto(
      {required this.addedDt,
      required this.cardId,
      required this.cleanSetName,
      required this.lowestPrice,
      required this.productName,
      required this.purchasedCount,
      required this.purchasedProductCleanName,
      required this.purchasedProductName,
      required this.purchasedStoreProductId,
      required this.setName,
      required this.usesCdn});

  factory RelatedProductDto.fromJson(Map<String, dynamic> json) =>
      _$RelatedProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedProductDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class TcgPlayerResponse {

  bool success;
  List<String> errors;

  TcgPlayerResponse({required this.success, required this.errors});

  factory TcgPlayerResponse.fromJson(Map<String, dynamic> json) =>
      _$TcgPlayerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TcgPlayerResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(includeIfNull: false)
class CategorySearchManifestDto {

  List<TcgPlayerField> sorting;
  List<CategoryFilter> filters;

  CategorySearchManifestDto({required this.filters, required this.sorting});

  factory CategorySearchManifestDto.fromJson(Map<String, dynamic> json) =>
      _$CategorySearchManifestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategorySearchManifestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

@JsonSerializable(includeIfNull: false)
class CategorySearchRequestDto {

  String sort;
  int limit;
  int offset;
  List<ProductFilter> filters;

  CategorySearchRequestDto({required this.filters, required this.limit, required this.offset, required this.sort});

  factory CategorySearchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CategorySearchRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategorySearchRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}
