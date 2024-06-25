import 'package:flutter/material.dart';
import 'package:testinginheritednotifier_course/expand_equally_extension.dart';
import 'package:testinginheritednotifier_course/slider_data.dart';
import 'package:testinginheritednotifier_course/slider_inherited_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SliderData sliderData = SliderData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SliderInheritedNotifier(
        sliderData: sliderData,
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Slider(
                  value: SliderInheritedNotifier.of(context),
                  onChanged: (value) {
                    sliderData.value = value;
                  },
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: SliderInheritedNotifier.of(context),
                      child: Container(
                        color: Colors.blueAccent,
                        height: 200,
                      ),
                    ),
                    Opacity(
                      opacity: SliderInheritedNotifier.of(context),
                      child: Container(
                        color: Colors.redAccent,
                        height: 200,
                      ),
                    ),
                  ].expandEqually().toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
