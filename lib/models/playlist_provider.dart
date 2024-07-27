import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song_model.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<SongModel> _playList = [
    SongModel(
      songName: "Ana Negm",
      artistName: "Cairokee",
      albumArtImagePath: "assets/images/cairikee1.jpeg",
      songPath: "audioes/ana_negm_cairokee1.mp3",
    ),
    SongModel(
      songName: "Basrah w Atooh",
      artistName: "Cairokee",
      albumArtImagePath: "assets/images/cairokee2.jpeg",
      songPath: "audioes/basrah_w_atooh_cairokee3.mp3",
    ),
    SongModel(
      songName: "Layla",
      artistName: "Cairokee",
      albumArtImagePath: "assets/images/cairokee3.jpeg",
      songPath: "audioes/layla_cairokee2.mp3",
    ),
    SongModel(
      songName: "It Will Be",
      artistName: "Shawn Mendes",
      albumArtImagePath: "assets/images/sad3.jpeg",
      songPath: "audioes/it_will_be_sad3.mp3",
    ),
    SongModel(
      songName: "Not You",
      artistName: "Alan Walker",
      albumArtImagePath: "assets/images/sad1.jpeg",
      songPath: "audioes/not_you_sad1.mp3",
    ),
    SongModel(
      songName: "Only Love Can Hurt Like That",
      artistName: "Paloma Faith",
      albumArtImagePath: "assets/images/sad2.jpeg",
      songPath: "audioes/only_love_can_hurt_like_this_sad2.mp3",
    ),
    SongModel(
      songName: "Middle Of The Night",
      artistName: "Elle Duhe",
      albumArtImagePath: "assets/images/study1.jpeg",
      songPath: "audioes/middle_of_night_study1.mp3",
    ),
    SongModel(
      songName: "Royalty",
      artistName: "ft.Neoni",
      albumArtImagePath: "assets/images/study2.jpeg",
      songPath: "audioes/royalty_study2.mp3",
    ),
    SongModel(
      songName: "Unstoppable",
      artistName: "Sia",
      albumArtImagePath: "assets/images/study3.jpeg",
      songPath: "audioes/unstoppable_study3.mp3",
    ),
  ];

// audioplayers

  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;
  int? _currentSongIndex;

  PlaylistProvider() {
    listenToDuration();
    _currentSongIndex = 0; // Default to the first song
  }

  void play() async {
    try {
      final String path = _playList[_currentSongIndex!].songPath;
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(path));
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void playNextSong() {
    if (_currentSongIndex != null && _playList.isNotEmpty) {
      _currentSongIndex = (_currentSongIndex! + 1) % _playList.length;
      play();
    }
  }

  void playPreviousSong() {
    if (_currentDuration.inSeconds > 2) {
      _audioPlayer.seek(Duration.zero);
    } else if (_currentSongIndex != null && _playList.isNotEmpty) {
      _currentSongIndex =
          (_currentSongIndex! - 1 + _playList.length) % _playList.length;
      play();
    }
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  List<SongModel> get playList => _playList;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    if (newIndex != null && newIndex < _playList.length) {
      _currentSongIndex = newIndex;
      play();
    }
    notifyListeners();
  }
}
