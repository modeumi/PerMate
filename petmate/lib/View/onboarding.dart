import 'package:flutter/material.dart';
import 'package:petmate/Provider/onboarding_provider.dart';
import 'package:petmate/Widget/onboarding/onboarding_appbar.dart';
import 'package:petmate/Widget/onboarding/onboarding_body.dart';
import 'package:petmate/Widget/onboarding/onboarding_bottom.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnboardingAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: PageView.builder(
          controller: context.watch<OnboardingProvider>().pageController,
          onPageChanged: (value) {
            context.read<OnboardingProvider>().page_change(value);
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return const OnboardingBody();
          },
        ),
      ),
      bottomSheet: OnboardingBottom(),
    );
  }
}
