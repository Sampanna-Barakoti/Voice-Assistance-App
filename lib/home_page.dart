import 'package:flutter/material.dart';
import 'package:voice_assistant/feature_box.dart';
import 'package:voice_assistant/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KIKI'),
        leading: Icon(Icons.menu),
        centerTitle: true,
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
                height: 143,
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
                color: Pallete.thirdSuggestionBoxColor,
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
        onPressed: () {},
        child: Icon(Icons.mic),
      ),
    );
  }
}
