class NotificationModel {
  int? notificationId;
  String? notificationTitle;
  String? notificationBody;
  int? notificationUsersid;
  String? notificationDatetime;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationBody,
      this.notificationUsersid,
      this.notificationDatetime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationUsersid = json['notification_usersid'];
    notificationDatetime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['notification_title'] = this.notificationTitle;
    data['notification_body'] = this.notificationBody;
    data['notification_usersid'] = this.notificationUsersid;
    data['notification_datetime'] = this.notificationDatetime;
    return data;
  }
}
