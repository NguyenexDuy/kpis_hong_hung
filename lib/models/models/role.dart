class Role {
  int id;
  String roleName;

  Role({
    required this.id,
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'] as int,
        roleName: json['rolename'],
      );

  Map<String, dynamic> toJson() {
    return {"id": id, "rolename": roleName};
  }
}
