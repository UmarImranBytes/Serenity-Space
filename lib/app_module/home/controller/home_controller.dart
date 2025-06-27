import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> mediaList = [
    {
      'image': 'assets/anxiety.png',
      'name': 'Anxiety',
      'time': '2 min',
      'description': 'A calming track to help ease anxiety.',
      'date': '2024-06-01',
      'audioTracks': [
        'assets/Bheege_Hoth_Tere_Pyasa.mp3',
        'assets/Bheeghi_Yaadein_Atif_Aslam.mp3',
      ]
    },
    {
      'image': 'assets/angry.png',
      'name': 'Anger',
      'time': '3 min',
      'description': 'Soothing audio to manage anger.',
      'date': '2024-06-02',
      'audioTracks': [
        'assets/Bol_Do_Na_Zara.mp3',
        'assets/Blah_Blah_Blah.mp3',
      ]
    },
    {
      'image': 'assets/irritation.png',
      'name': 'Irritation',
      'time': '3 min',
      'description': 'Relieve irritation with this meditation.',
      'date': '2024-06-03',
      'audioTracks': [
        'assets/Broken_Love_Mashup.mp3',
        'assets/Bhikra_Rovalio.mp3',
      ]
    },
    {
      'image': 'assets/sadness.png',
      'name': 'Sadness',
      'time': '3 min',
      'description': 'Comforting audio to uplift your mood.',
      'date': '2024-06-04',
      'audioTracks': [
        'assets/Judaai_JioSongs.mp3',
        'assets/Aankhon_Mein_Teri_Ajab_Si.mp3',
      ]
    },
    {
      'image': 'assets/fear.png',
      'name': 'Fear',
      'time': '3 min',
      'description': 'Gain courage through mindful listening.',
      'date': '2024-06-05',
      'audioTracks': [
        'assets/Chaar_Kadam_JioSongs.mp3',
        'assets/Surili_Akhiyon_Wale.mp3',
      ]
    },
    {
      'image': 'assets/worry.png',
      'name': 'Worry',
      'time': '4 min',
      'description': 'Let go of worries with this audio.',
      'date': '2024-06-06',
      'audioTracks': [
        'assets/Blue_One_Love.mp3',
        'assets/Bora_Bora_PagalNew.mp3',
      ]
    },
    {
      'image': 'assets/envy.png',
      'name': 'Envy',
      'time': '3 min',
      'description': 'Find peace and gratitude.',
      'date': '2024-06-07',
      'audioTracks': [
        'assets/Calaboose_Sidhu.mp3',
        'assets/Brown_Munde.mp3',
      ]
    },
  ];
}
