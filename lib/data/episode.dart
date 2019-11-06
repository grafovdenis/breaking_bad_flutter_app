class Episode {
  final int id;
  final String title;
  final int season;
  final int episode;
  final String airDate;
  final List characters;
  final String series;

  const Episode(
      {this.id,
      this.title,
      this.season,
      this.episode,
      this.airDate,
      this.characters,
      this.series});
}
