class HotelModel {
  HotelModel({
      this.result, 
      this.data,});

  HotelModel.fromJson(dynamic json) {
    result = json['result'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? result;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.body,});

  Data.fromJson(dynamic json) {
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  Body? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }

}

class Body {
  Body({
      this.header, 
      this.query, 
      this.searchResults,});

  Body.fromJson(dynamic json) {
    header = json['header'];
    query = json['query'] != null ? Query.fromJson(json['query']) : null;
    searchResults = json['searchResults'] != null ? SearchResults.fromJson(json['searchResults']) : null;
  }
  String? header;
  Query? query;
  SearchResults? searchResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['header'] = header;
    if (query != null) {
      map['query'] = query?.toJson();
    }
    if (searchResults != null) {
      map['searchResults'] = searchResults?.toJson();
    }
    return map;
  }

}

class SearchResults {
  SearchResults({
      this.totalCount, 
      this.results,});

  SearchResults.fromJson(dynamic json) {
    totalCount = json['totalCount'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
  int? totalCount;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalCount'] = totalCount;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Results {
  Results({
      this.id, 
      this.name, 
      this.starRating, 
      this.urls, 
      this.address, 
      this.ratePlan, 
      this.neighbourhood, 
      this.optimizedThumbUrls,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    starRating = json['starRating'];
    urls = json['urls'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    ratePlan = json['ratePlan'] != null ? RatePlan.fromJson(json['ratePlan']) : null;
    neighbourhood = json['neighbourhood'];
    optimizedThumbUrls = json['optimizedThumbUrls'] != null ? OptimizedThumbUrls.fromJson(json['optimizedThumbUrls']) : null;
  }
  int? id;
  String? name;
  double? starRating;
  dynamic urls;
  Address? address;
  RatePlan? ratePlan;
  String? neighbourhood;
  OptimizedThumbUrls? optimizedThumbUrls;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['starRating'] = starRating;
    map['urls'] = urls;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    if (ratePlan != null) {
      map['ratePlan'] = ratePlan?.toJson();
    }
    map['neighbourhood'] = neighbourhood;
    if (optimizedThumbUrls != null) {
      map['optimizedThumbUrls'] = optimizedThumbUrls?.toJson();
    }
    return map;
  }

}

class OptimizedThumbUrls {
  OptimizedThumbUrls({
      this.srpDesktop,});

  OptimizedThumbUrls.fromJson(dynamic json) {
    srpDesktop = json['srpDesktop'];
  }
  String? srpDesktop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['srpDesktop'] = srpDesktop;
    return map;
  }

}

class RatePlan {
  RatePlan({
      this.price,});

  RatePlan.fromJson(dynamic json) {
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
  }
  Price? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (price != null) {
      map['price'] = price?.toJson();
    }
    return map;
  }

}

class Price {
  Price({
      this.current, 
      this.exactCurrent, 
      this.old,});

  Price.fromJson(dynamic json) {
    current = json['current'];
    exactCurrent = json['exactCurrent'];
    old = json['old'];
  }
  String? current;
  double? exactCurrent;
  String? old;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current'] = current;
    map['exactCurrent'] = exactCurrent;
    map['old'] = old;
    return map;
  }

}

class Address {
  Address({
      this.streetAddress, 
      this.extendedAddress, 
      this.locality, 
      this.postalCode, 
      this.region, 
      this.countryName, 
      this.countryCode,});

  Address.fromJson(dynamic json) {
    streetAddress = json['streetAddress'];
    extendedAddress = json['extendedAddress'];
    locality = json['locality'];
    postalCode = json['postalCode'];
    region = json['region'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
  }
  String? streetAddress;
  String? extendedAddress;
  String? locality;
  String? postalCode;
  String? region;
  String? countryName;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['streetAddress'] = streetAddress;
    map['extendedAddress'] = extendedAddress;
    map['locality'] = locality;
    map['postalCode'] = postalCode;
    map['region'] = region;
    map['countryName'] = countryName;
    map['countryCode'] = countryCode;
    return map;
  }

}

class Query {
  Query({
      this.destination,});

  Query.fromJson(dynamic json) {
    destination = json['destination'] != null ? Destination.fromJson(json['destination']) : null;
  }
  Destination? destination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (destination != null) {
      map['destination'] = destination?.toJson();
    }
    return map;
  }

}

class Destination {
  Destination({
      this.id, 
      this.value, 
      this.resolvedLocation,});

  Destination.fromJson(dynamic json) {
    id = json['id'];
    value = json['value'];
    resolvedLocation = json['resolvedLocation'];
  }
  String? id;
  String? value;
  String? resolvedLocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['value'] = value;
    map['resolvedLocation'] = resolvedLocation;
    return map;
  }

}