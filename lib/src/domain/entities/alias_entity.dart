class AliasEntity {
  final String alias;
  final LinksEntity links;

  AliasEntity({
    required this.alias,
    required this.links,
  });

  factory AliasEntity.fromJson(Map<String, dynamic> json) {
    return AliasEntity(
      alias: json['alias'],
      links: LinksEntity.fromJson(json['_links']),
    );
  }
}

class LinksEntity {
  final String self;
  final String short;

  LinksEntity({
    required this.self,
    required this.short,
  });

  factory LinksEntity.fromJson(Map<String, dynamic> json) {
    return LinksEntity(
      self: json['self'],
      short: json['short'],
    );
  }
}
