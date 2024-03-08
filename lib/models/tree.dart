import "package:hive/hive.dart";
import "package:hive_flutter/adapters.dart";

part "tree.g.dart";

@HiveType(typeId: 0)
class Tree extends HiveObject {
  @HiveField(0)
  late String species;

  @HiveField(1)
  late DateTime plantingDate;

  @HiveField(2)
  late String location;

  Tree({ 
    required this.species,
    required this.plantingDate,
    required this.location
  });

  Tree.fromJson(Map<String, dynamic> json)
  : species =  json["species"],
    plantingDate = DateTime.parse(json['plantingDate']),
    location = json["location"];

  Map<String, dynamic> toJson() => 
  {
    "species": species,
    "plantingDate": plantingDate.toIso8601String(),
    "location": location,
  };
}