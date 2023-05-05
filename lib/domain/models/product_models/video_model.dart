class VideoModel {
  String? message;
  bool? status;
  VideoData? data;

  VideoModel({this.message, this.status, this.data});

  VideoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? VideoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VideoData {
  Video? video;

  VideoData({this.video});

  VideoData.fromJson(Map<String, dynamic> json) {
    video = json['video'] != null ? Video.fromJson(json['video']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (video != null) {
      data['video'] = video!.toJson();
    }
    return data;
  }
}

class Video {
  String? sId;
  String? mainVideo;

  Video({this.sId, this.mainVideo});

  Video.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mainVideo = json['mainVideo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['mainVideo'] = mainVideo;
    return data;
  }
}
