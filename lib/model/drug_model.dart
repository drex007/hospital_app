class DrugModel {
  String? id;
  int? pkid;
  String? name;
  DrugCategory? drugCategory;
  String? drugSubstitute;
  int? quantity;
  int? alertQuantity;
  bool? locked;
  int? drugAuthor;

  DrugModel(
      {this.id,
      this.pkid,
      this.name,
      this.drugCategory,
      this.drugSubstitute,
      this.quantity,
      this.alertQuantity,
      this.locked,
      this.drugAuthor});

  DrugModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    name = json['name'];
    drugCategory = json['drug_category'] != null
        ? new DrugCategory.fromJson(json['drug_category'])
        : null;
    drugSubstitute = json['drug_substitute'];
    quantity = json['quantity'];
    alertQuantity = json['alert_quantity'];
    locked = json['locked'];
    drugAuthor = json['drug_author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['name'] = this.name;
    if (this.drugCategory != null) {
      data['drug_category'] = this.drugCategory!.toJson();
    }
    data['drug_substitute'] = this.drugSubstitute;
    data['quantity'] = this.quantity;
    data['alert_quantity'] = this.alertQuantity;
    data['locked'] = this.locked;
    data['drug_author'] = this.drugAuthor;
    return data;
  }
}

class DrugCategory {
  int? pkid;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? category;
  String? description;
  int? createdBy;

  DrugCategory(
      {this.pkid,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.description,
      this.createdBy});

  DrugCategory.fromJson(Map<String, dynamic> json) {
    pkid = json['pkid'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'];
    description = json['description'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pkid'] = this.pkid;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category'] = this.category;
    data['description'] = this.description;
    data['created_by'] = this.createdBy;
    return data;
  }
}
