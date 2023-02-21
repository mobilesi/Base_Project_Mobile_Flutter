abstract class BaseEntity {
  Map<String, dynamic> toJson();

  BaseEntity.fromJson(Map<String, dynamic> map);
}
