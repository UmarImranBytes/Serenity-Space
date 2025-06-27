import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color/app_color.dart';
import '../../widegts/app_text/app_text.dart';
import 'consultant_detail_screen.dart';

class Consultant {
  final String name;
  final String type;
  final double rating;
  final String about;
  final String availableSlots;

  Consultant({
    required this.name,
    required this.type,
    required this.rating,
    required this.about,
    required this.availableSlots,
  });
}

class ConsultantController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<Consultant> allConsultants = [
    Consultant(
      name: 'Dr. Ayesha Khan',
      type: 'Psychiatrist',
      rating: 4.8,
      about: 'Helps individuals manage anxiety disorders through therapy and medication. Specializes in cognitive behavioral therapy.',
      availableSlots: 'Mon-Fri: 10:00AM - 5:00PM',
    ),
    Consultant(
      name: 'Dr. Omar Siddiqui',
      type: 'Clinical Psychologist',
      rating: 4.5,
      about: 'Expert in treating depression, stress, and emotional trauma with evidence-based psychological techniques.',
      availableSlots: 'Mon-Fri: 9:00AM - 4:00PM',
    ),
    Consultant(
      name: 'Dr. Sadaf Riaz',
      type: 'Counseling Psychologist',
      rating: 4.2,
      about: 'Focuses on anger management, relationship counseling, and building emotional resilience.',
      availableSlots: 'Mon-Fri: 11:00AM - 6:00PM',
    ),
    Consultant(
      name: 'Dr. Imran Farooq',
      type: 'Neuropsychiatrist',
      rating: 4.6,
      about: 'Deals with stress-related brain and mood disorders, including chronic anxiety and nervousness.',
      availableSlots: 'Mon-Fri: 10:00AM - 3:00PM',
    ),
    Consultant(
      name: 'Dr. Hina Malik',
      type: 'Therapist',
      rating: 4.7,
      about: 'Provides therapy sessions to reduce irritation, improve self-control, and boost mindfulness.',
      availableSlots: 'Mon-Sat: 12:00PM - 6:00PM',
    ),
    Consultant(
      name: 'Dr. Kamran Javed',
      type: 'Psychotherapist',
      rating: 4.4,
      about: 'Specializes in deep talk therapy for unresolved sadness, grief, and emotional healing.',
      availableSlots: 'Tue-Sat: 1:00PM - 5:00PM',
    ),
    Consultant(
      name: 'Dr. Mahnoor Qureshi',
      type: 'Child Psychologist',
      rating: 4.3,
      about: 'Helps children and teens deal with emotional stress, behavioral issues, and school pressure.',
      availableSlots: 'Mon-Fri: 2:00PM - 7:00PM',
    ),
    Consultant(
      name: 'Dr. Yasir Nawaz',
      type: 'Behavioral Therapist',
      rating: 4.6,
      about: 'Guides individuals through behavioral changes to handle anger, aggression, and irritability.',
      availableSlots: 'Mon-Fri: 11:00AM - 4:00PM',
    ),
    Consultant(
      name: 'Dr. Iqra Shah',
      type: 'Mindfulness Coach',
      rating: 4.9,
      about: 'Teaches mindfulness techniques and breathing exercises to reduce anxiety and stress.',
      availableSlots: 'Mon-Fri: 10:00AM - 6:00PM',
    ),
    Consultant(
      name: 'Dr. Salman Raza',
      type: 'Life Coach',
      rating: 4.5,
      about: 'Helps clients with emotional regulation, confidence building, and positive mindset development.',
      availableSlots: 'Mon-Thu: 12:00PM - 5:00PM',
    ),
    Consultant(
      name: 'Dr. Rida Khalid',
      type: 'Family Therapist',
      rating: 4.7,
      about: 'Supports families facing communication gaps, parenting stress, and emotional disconnect.',
      availableSlots: 'Tue-Sat: 10:00AM - 5:00PM',
    ),
    Consultant(
      name: 'Dr. Bilal Yousaf',
      type: 'Wellness Expert',
      rating: 4.4,
      about: 'Offers mental health coaching, stress detox plans, and emotional well-being routines.',
      availableSlots: 'Mon-Fri: 9:00AM - 3:00PM',
    ),
  ];

  RxList<Consultant> filteredConsultants = <Consultant>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredConsultants.value = allConsultants;
    searchController.addListener(filterConsultants);
  }

  void clearSearch() {
    searchController.clear();
    filterConsultants();
  }

  void filterConsultants() {
    String query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredConsultants.value = allConsultants;
    } else {
      filteredConsultants.value = allConsultants.where((consultant) =>
          consultant.name.toLowerCase().contains(query)).toList();
    }
  }
}

class ConsultantScreen extends StatelessWidget {
  final ConsultantController controller = Get.put(ConsultantController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E97E8), Color(0xFF9BF2B1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: 'Chat with consultant now',
                  size: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          hintText: 'Search consultant',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: controller.clearSearch,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.filteredConsultants.length,
                      itemBuilder: (context, index) {
                        final consultant = controller.filteredConsultants[index];
                        return InkWell(
                          onTap: () => Get.to(() => ConsultantDetailScreen(consultant: consultant)),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primaryAppBar,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.person, color: Colors.blue, size: 32),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        consultant.name,
                                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        consultant.type,
                                        style: const TextStyle(color: Colors.white70),
                                      ),
                                      Row(
                                        children: List.generate(
                                          consultant.rating.floor(),
                                              (i) => const Icon(Icons.star, color: Colors.orange, size: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => Get.to(() => ConsultantDetailScreen(consultant: consultant)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text('Chat'),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
