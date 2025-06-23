import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_assistant/feature_box.dart';
import 'package:voice_assistant/openai_serive.dart';
import 'package:voice_assistant/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  String lastword = '';
  final OpenAIService openAIService = OpenAIService();

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
    //   bool available = await speechToText.initialize(
    //     onStatus: (status) => print(' STATUS: $status'),
    //     onError: (error) => print('ERROR: $error'),
    //   );
    //   print(available ? "✅ Plugin initialized" : " Plugin not available");
    // }
  }

  /// Each time to start a speech recognition session
  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    print("You said: ${result.recognizedWords}");
    setState(() {
      lastword = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALLEN'),
        leading: Icon(Icons.menu),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // -------------------------virtual assistant profile
          Stack(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Pallete.assistantCircleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/virtualAssistant.png'),
                  ),
                ),
              ),
            ],
          ),

          //------------------- chat bubble
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
            decoration: BoxDecoration(
              border: Border.all(color: Pallete.borderColor),
              borderRadius: BorderRadius.circular(
                16,
              ).copyWith(topLeft: Radius.zero),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Good Morning, What task can i do for you?',
                style: TextStyle(
                  fontSize: 18,
                  color: Pallete.mainFontColor,
                  fontFamily: 'cera pro',
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, left: 18),
            alignment: Alignment.centerLeft,
            child: Text(
              'Here are some few Features',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'cera pro',
                fontSize: 20,
                color: Pallete.mainFontColor,
              ),
            ),
          ),

          // -------------------------features box
          Column(
            children: [
              FeatureBox(
                color: Pallete.firstSuggestionBoxColor,
                headerText: 'ChatGPT',
                descriptionText:
                    "Hello, I can you as an Chatbot in a effective way search up things",
              ),
              FeatureBox(
                color: Pallete.secondSuggestionBoxColor,
                headerText: 'DALL-E',
                descriptionText:
                    "Get inpired and stay creative with your personal assistant powered by DALL-E",
              ),
              FeatureBox(
                color: const Color.fromARGB(255, 123, 199, 237),
                headerText: 'Smart Voice Assistant',
                descriptionText:
                    "Get the best of th both Voice assistant by ChatGPT and DALL-E",
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await stopListening();
            final response = await openAIService.isArtPromptAPI(lastword);
            print('🔁 OpenAI Response: $response');
          } else {
            initSpeechToText();
          }
        },
        child: Icon(Icons.mic),
      ),
    );
  }
}
