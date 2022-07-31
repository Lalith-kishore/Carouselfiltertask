class JsonParser {
  List<Model> _faqs = [];

  List<Model> get faq => _faqs;

  FaqJsonParser({List<Model>? checklists}) {
    _faqs = checklists!;
  }

  JsonParser.fromJson(dynamic? json) {
    if (json != null) {
      _faqs = [];
      json.forEach((v) {
        _faqs.add(Model.fromJson(v));
      });
    }
  }

  /*Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_faqs != null) {
      map["feesStructure"] = _faqs.map((v) => v.toJson()).toList();
    }
    return map;
  }*/
}

class Model {
  int? _id;
  String? _title;
  String? _content;

  int get id => _id!;

  String get title => _title!;

  String get content => _content!;

  Faqs({
    int? id,
    String? title,
    String? content,
  }) {
    _id = id!;
    _title = title!;
    _content = content!;
  }

  Model.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"]["rendered"];
    _content = json["content"]["rendered"];
  }

  /* Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["question"] = _question;
    map["answer"] = _answer;
    map["category"] = _category;
    map["page"] = _page;
    map["mobilepage"] = _mobilepage;

    return map;
  }*/
}
