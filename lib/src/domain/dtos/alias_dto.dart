class AliasDto {
  final String url;
  final String alias;

  AliasDto({
    required this.alias,
    required this.url,
  });

  factory AliasDto.fromEmpty() => AliasDto(
    url: '',
    alias: '',
  );
}
