import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nba_highlights/models/category_model.dart';
import 'package:nba_highlights/utils/colors.dart';
import 'package:nba_highlights/utils/text_styles.dart';
import 'package:nba_highlights/widgets/button.dart';

class CategoryDetailScreen extends StatefulWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  late FlutterTts flutterTts;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    _initTts();

    // set the callback for when speaking is finished
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });
  }

  void _initTts() {
    flutterTts.setLanguage("en-US");
    flutterTts.setSpeechRate(0.4);
    flutterTts.setPitch(1.0);
    flutterTts.setVolume(0.5);
    flutterTts.setVoice({"name": "en-us-x-tpd-local", "locale": "en-US"});
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  // function to toggle play/stop
  void togglePlayStop() async {
    if (isPlaying) {
      await flutterTts.stop(); // Stop  speaking
      HapticFeedback.lightImpact();
    } else {
      if (await flutterTts.isLanguageAvailable("en-US")) {
        await flutterTts.speak(widget.category.description); // Start speaking
        HapticFeedback.lightImpact();
      } else {
        print("TTS language not available");
      }
    }

    setState(() {
      isPlaying = !isPlaying; // Toggle button state
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // row for category title and play button
              Row(
                children: [
                  Text(widget.category.title, style: AppTextStyles.appTitle),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: isPlaying
                              ? AppColors.lightGreen
                              : AppColors.kPrimaryColor,
                          width: 1.0,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.only(left: 10.0, right: 15.0),
                    ),
                    onPressed: togglePlayStop,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isPlaying ? Icons.stop : Icons.play_arrow,
                          color: isPlaying
                              ? AppColors.lightGreen
                              : AppColors.kPrimaryColor,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          isPlaying ? "Stop" : "Play",
                          style: TextStyle(
                            fontSize: 14,
                            color: isPlaying
                                ? AppColors.lightGreen
                                : AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              // category image
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.textColor,
                    width: 1, // Border width
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.category.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // category description
              Text(
                widget.category.description,
                style: AppTextStyles.appDescription,
              ),
              Spacer(),

              // button to exit
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                buttonText: "Back",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
