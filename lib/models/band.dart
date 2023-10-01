class Band {
  String id;
  String name;
  int votes;

  Band(
      {required this.id,
      required this.name,
      required this.votes //if we don't have a value for the parameter then it will be null by default and if we want to set that
      });

  factory Band.fromMap(Map<String, dynamic> obj) => Band(
      id: obj.containsKey('id') ? obj['id'] : 'no-id',
      name: obj.containsKey('name') ? obj['name'] : 'no-name',
      votes: obj.containsKey('votes') ? obj['votes'] : 'no-votes');
}
