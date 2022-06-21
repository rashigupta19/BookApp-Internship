class Lead {
  String type;
  String createdOn;
  int totalAppts;
  int completedAppts;
  String sId;
  String email;
  String notaryId;
  String name;
  String companyName;
  int phoneNumber;
  String companyAddress;
  int iV;

  Lead(
      {this.type,
      this.createdOn,
      this.totalAppts,
      this.completedAppts,
      this.sId,
      this.email,
      this.notaryId,
      this.name,
      this.companyName,
      this.phoneNumber,
      this.companyAddress,
      this.iV});

  Lead.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    createdOn = json['createdOn'];
    totalAppts = json['totalAppts'];
    completedAppts = json['completedAppts'];
    sId = json['_id'];
    email = json['email'];
    notaryId = json['notaryId'];
    name = json['name'];
    companyName = json['companyName'];
    phoneNumber = json['PhoneNumber'];
    companyAddress = json['companyAddress'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['createdOn'] = this.createdOn;
    data['totalAppts'] = this.totalAppts;
    data['completedAppts'] = this.completedAppts;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['notaryId'] = this.notaryId;
    data['name'] = this.name;
    data['companyName'] = this.companyName;
    data['PhoneNumber'] = this.phoneNumber;
    data['companyAddress'] = this.companyAddress;
    data['__v'] = this.iV;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "type:$type";
    ;
  }
}
