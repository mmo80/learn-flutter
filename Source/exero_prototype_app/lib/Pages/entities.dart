// =============== ENTITIES : start

class ExerciseItem {
  String id;
  String name;
  String note;

  ExerciseItem(this.id, this.name, this.note);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "name": name,
      "note": note,
    };
  }

  static ExerciseItem fromJson(Map<String, Object> json) {
    return new ExerciseItem(
      json["id"] as String,
      json["name"] as String,
      json["note"] as String,
    );
  }
}

class Item {
  String pageName;
  String label;

  Item(this.pageName, this.label);
}

class ExerciseSetData {
  String setNo;
  String reps;
  String weight;
  String unit;
  bool warmup;
  bool dropSet;
}

// =============== ENTITIES : end