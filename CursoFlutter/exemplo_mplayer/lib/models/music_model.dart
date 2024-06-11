class MusicModel {
  final String title;
  final String artist;
  final String url;

  MusicModel(this.title, this.artist, this.url);

  //from map
  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return new MusicModel(json['title'], json['artist'], json['url']);
  }
}
