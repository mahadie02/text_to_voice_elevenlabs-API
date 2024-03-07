// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t2v/res/app_data.dart';
import 'package:t2v/res/components.dart';
import '../controllers/homepage_controller.dart';
import 'package:t2v/model/all_actions.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Text to Voice",
        ),
        actions: [
          IconButton(
              onPressed: AllActions().showDevInfo,
              icon: Icon(
                Icons.info_outline_rounded,
                color: AppData().primaryColorDark,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Flexible(
                    child: TextFieldX(
                        controller: controller.apiKey,
                        hintText: "Your ElevenLabs' API Key...",
                        isPass: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppData().bgColorDark,
                            shape: BoxShape.circle,
                            boxShadow: [shadowGlow]),
                        child: Center(
                          child: Obx(() => IconButton(
                              onPressed: controller.onUserInfo,
                              icon: controller.isGettingUser.value
                                  ? const Center(
                                      child: SizedBox(
                                          child: CircularProgressIndicator()),
                                    )
                                  : Icon(
                                      Icons.refresh,
                                      color: AppData().primaryColorDark,
                                    ))),
                        )),
                  ),
                ],
              ),
            ),
            TextFieldX(
              controller: controller.textController,
              hintText: "Your Text Here...",
              multiLine: 5,
              isPass: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const BodyText('Remaining Characters: '),
                  Obx(() => BodyText(controller.voiceLimit.toString()))
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => ListDropDown(
                    dropDownList: controller.voiceList.value.toList(),
                    onListSelect: controller.onVoiceSelect,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppData().bgColorDark,
                          shape: BoxShape.circle,
                          boxShadow: [shadowGlow]),
                      child: Center(
                        child: Obx(() => IconButton(
                            onPressed: controller.onVoiceFetch,
                            icon: controller.isGettingVoice.value
                                ? const Center(
                                    child: SizedBox(
                                        child: CircularProgressIndicator()),
                                  )
                                : Icon(
                                    Icons.refresh,
                                    color: AppData().primaryColorDark,
                                  ))),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 10),
            VoiceSettingsSlider(value: controller.voiceStability),
            VoiceSettingsSlider(value: controller.similarityBoost),
            const SizedBox(height: 10),
            Obx(
              () => GestureDetector(
                  onTap: controller.onTextToVoice,
                  child: Stack(
                    children: [
                      GlowingCircle(
                        isGlowing: controller.isTalking.value,
                      ),
                      controller.isGeneratingVoice.value
                          ? Center(
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: AppData().bgColorDark,
                                    shape: BoxShape.circle,
                                    boxShadow: [shadowGlow]),
                                child: CircularProgressIndicator(
                                  color: AppData().primaryColorDark,
                                ),
                              ),
                            )
                          : const CircularMic(),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldX(
              controller: controller.directory,
              hintText: "Save Directory",
              isPass: false,
            ),
            Row(
              children: [
                Flexible(
                  child: TextFieldX(
                    controller: controller.fileName,
                    hintText: "File Name",
                    isPass: false,
                  ),
                ),
                ListDropDown(
                    dropDownList: controller.fileFormats.value.toList(),
                    onListSelect: controller.onFormatSelect)
              ],
            ),
            const SizedBox(height: 10),
            // IconButton(
            //     onPressed: () {
            //       final x = controller
            //           .extractFirstLine(controller.textController.text);
            //       print(x);
            //     },
            //     icon: const Icon(Icons.settings))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onSave,
        child: const Icon(Icons.save),
      ),
    );
  }
}
