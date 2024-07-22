// property.dart

class Property {
  final String acceptBuyersTitle;
  final String architextName;
  final String assetType;
  final String builderName;
  final String builtupArea;
  final String carParking;
  final String interiorAccess;
  final String ownership;
  final String possesionTime;
  final String propertyBuiltYear;
  final String propertyTaxID;
  final String rentable;
  final String address;
  final String auctionStatus;
  final String builtUpArea;
  final String category;
  final String currentBid;
  final String description;
  final String id;
  final String imageAssetPath;
  final List<String> imagePaths;
  final int propertyIndex;
  final String latitude;
  final String listedBy;
  final String longitude;
  final String lotSize;
  final String lotSize2;
  final String propertyFloor;
  final String propertyType;
  final String startingBid;
  final String subtitle2FC;
  final String subtitle3FC;
  final String subtitle4FC;
  final String subtitleFC;
  final String title;
  final String title4;
  final String totalFloor;
  final String trailing2FC;
  final String trailing3FC;
  final String trailing4FC;
  final String trailingFC;
  final String type;

  Property({
    required this.acceptBuyersTitle,
    required this.architextName,
    required this.assetType,
    required this.builderName,
    required this.builtupArea,
    required this.carParking,
    required this.interiorAccess,
    required this.ownership,
    required this.possesionTime,
    required this.propertyBuiltYear,
    required this.propertyTaxID,
    required this.rentable,
    required this.address,
    required this.auctionStatus,
    required this.builtUpArea,
    required this.category,
    required this.currentBid,
    required this.description,
    required this.id,
    required this.imageAssetPath,
    required this.imagePaths,
    required this.propertyIndex,
    required this.latitude,
    required this.listedBy,
    required this.longitude,
    required this.lotSize,
    required this.lotSize2,
    required this.propertyFloor,
    required this.propertyType,
    required this.startingBid,
    required this.subtitle2FC,
    required this.subtitle3FC,
    required this.subtitle4FC,
    required this.subtitleFC,
    required this.title,
    required this.title4,
    required this.totalFloor,
    required this.trailing2FC,
    required this.trailing3FC,
    required this.trailing4FC,
    required this.trailingFC,
    required this.type,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      acceptBuyersTitle: json['AcceptBuyersTitle'],
      architextName: json['ArchitextName'],
      assetType: json['AssetType'],
      builderName: json['BuilderName'],
      builtupArea: json['BuiltupArea'],
      carParking: json['CarParking'],
      interiorAccess: json['InteriorAccess'],
      ownership: json['Ownership'],
      possesionTime: json['PossesionTime'],
      propertyBuiltYear: json['PropertyBuiltYear'],
      propertyTaxID: json['PropertyTaxID'],
      rentable: json['Rentable'],
      address: json['address'],
      auctionStatus: json['auctionStatus'],
      builtUpArea: json['builtUpArea'],
      category: json['category'],
      currentBid: json['currentBid'],
      description: json['description'],
      id: json['id'],
      imageAssetPath: json['imageAssetPath'],
      imagePaths: List<String>.from(json['imagePaths']),
      propertyIndex: json['index'],
      latitude: json['latitude'],
      listedBy: json['listedBy'],
      longitude: json['longitude'],
      lotSize: json['lotSize'],
      lotSize2: json['lotSize2'],
      propertyFloor: json['propertyFloor'],
      propertyType: json['propertyType'],
      startingBid: json['startingBid'],
      subtitle2FC: json['subtitle2FC'],
      subtitle3FC: json['subtitle3FC'],
      subtitle4FC: json['subtitle4FC'],
      subtitleFC: json['subtitleFC'],
      title: json['title'],
      title4: json['title4FC'],
      totalFloor: json['totalFloor'],
      trailing2FC: json['trailing2FC'],
      trailing3FC: json['trailing3FC'],
      trailing4FC: json['trailing4FC'],
      trailingFC: json['trailingFC'],
      type: json['type'],
    );
  }
}
