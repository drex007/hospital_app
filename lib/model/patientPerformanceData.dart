class PatientPerformanceData {
  String? date;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? temperature;
  String? respiration;
  String? pulse;
  String? bloodPressureSys;
  String? bloodPressureDia;
  String? period;
  String? remark;

  PatientPerformanceData(
      {this.date,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.temperature,
      this.respiration,
      this.pulse,
      this.bloodPressureSys,
      this.bloodPressureDia,
      this.period,
      this.remark});

  PatientPerformanceData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    temperature = json['temperature'];
    respiration = json['respiration'];
    pulse = json['pulse'];
    bloodPressureSys = json['blood_pressure_sys'];
    bloodPressureDia = json['blood_pressure_dia'];
    period = json['period'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['temperature'] = this.temperature;
    data['respiration'] = this.respiration;
    data['pulse'] = this.pulse;
    data['blood_pressure_sys'] = this.bloodPressureSys;
    data['blood_pressure_dia'] = this.bloodPressureDia;
    data['period'] = this.period;
    data['remark'] = this.remark;
    return data;
  }
}
