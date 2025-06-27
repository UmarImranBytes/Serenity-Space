import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';

class MediaCardWidget extends StatefulWidget {
  final String imagePath;
  final String name;
  final String time;
  final List<String> audioTracks;
  final Color backgroundColor;

  const MediaCardWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.time,
    required this.audioTracks,
    required this.backgroundColor,
  });

  @override
  State<MediaCardWidget> createState() => _MediaCardWidgetState();
}

class _MediaCardWidgetState extends State<MediaCardWidget> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  int? selectedTrackIndex;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
    _audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        isPlaying = false;
        selectedTrackIndex = null;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playTrack(String audioPath, int index) async {
    try {
      await _audioPlayer.stop();
      final relativePath = audioPath.replaceFirst('assets/', '');
      await _audioPlayer.play(AssetSource(relativePath));
      setState(() {
        selectedTrackIndex = index;
        isPlaying = true;
      });
    } catch (e) {
      debugPrint('Error playing track: $e');
    }
  }

  Future<void> pauseTrack() async {
    await _audioPlayer.pause();
    setState(() => isPlaying = false);
  }

  void showAlbumSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${widget.name} Album',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...List.generate(widget.audioTracks.length, (index) {
                final title = 'Track ${index + 1}';
                final audioPath = widget.audioTracks[index];
                return ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(title),
                  subtitle: Text(widget.time),
                  trailing: IconButton(
                    icon: Icon(
                      selectedTrackIndex == index && isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      if (selectedTrackIndex == index && isPlaying) {
                        pauseTrack();
                      } else {
                        playTrack(audioPath, index);
                      }
                    },
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showAlbumSheet(context),
      child: Card(
        color: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.time,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.imagePath,
                    width: 90.w,
                    height: 90.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
