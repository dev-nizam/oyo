class SearchModel {
  SearchModel({
      this.term, 
      this.moresuggestions, 
      this.autoSuggestInstance, 
      this.trackingID, 
      this.misspellingfallback, 
      this.suggestions, 
      this.geocodeFallback,});

  SearchModel.fromJson(dynamic json) {
    term = json['term'];
    moresuggestions = json['moresuggestions'];
    autoSuggestInstance = json['autoSuggestInstance'];
    trackingID = json['trackingID'];
    misspellingfallback = json['misspellingfallback'];
    if (json['suggestions'] != null) {
      suggestions = [];
      json['suggestions'].forEach((v) {
        suggestions?.add(Suggestions.fromJson(v));
      });
    }
    geocodeFallback = json['geocodeFallback'];
  }
  String? term;
  int? moresuggestions;
  dynamic autoSuggestInstance;
  String? trackingID;
  bool? misspellingfallback;
  List<Suggestions>? suggestions;
  bool? geocodeFallback;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['term'] = term;
    map['moresuggestions'] = moresuggestions;
    map['autoSuggestInstance'] = autoSuggestInstance;
    map['trackingID'] = trackingID;
    map['misspellingfallback'] = misspellingfallback;
    if (suggestions != null) {
      map['suggestions'] = suggestions?.map((v) => v.toJson()).toList();
    }
    map['geocodeFallback'] = geocodeFallback;
    return map;
  }

}

class Suggestions {
  Suggestions({
      this.group, 
      this.entities,});

  Suggestions.fromJson(dynamic json) {
    group = json['group'];
    if (json['entities'] != null) {
      entities = [];
      json['entities'].forEach((v) {
        entities?.add(Entities.fromJson(v));
      });
    }
  }
  String? group;
  List<Entities>? entities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['group'] = group;
    if (entities != null) {
      map['entities'] = entities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Entities {
  Entities({
      this.geoId, 
      this.destinationId, 
      this.landmarkCityDestinationId, 
      this.type, 
      this.redirectPage, 
      this.latitude, 
      this.longitude, 
      this.searchDetail, 
      this.caption, 
      this.name,});

  Entities.fromJson(dynamic json) {
    geoId = json['geoId'];
    destinationId = json['destinationId'];
    landmarkCityDestinationId = json['landmarkCityDestinationId'];
    type = json['type'];
    redirectPage = json['redirectPage'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    searchDetail = json['searchDetail'];
    caption = json['caption'];
    name = json['name'];
  }
  String? geoId;
  String? destinationId;
  dynamic landmarkCityDestinationId;
  String? type;
  String? redirectPage;
  double? latitude;
  double? longitude;
  dynamic searchDetail;
  String? caption;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['geoId'] = geoId;
    map['destinationId'] = destinationId;
    map['landmarkCityDestinationId'] = landmarkCityDestinationId;
    map['type'] = type;
    map['redirectPage'] = redirectPage;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['searchDetail'] = searchDetail;
    map['caption'] = caption;
    map['name'] = name;
    return map;
  }

}