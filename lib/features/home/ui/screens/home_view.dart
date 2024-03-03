import 'package:diary_emotional_frontend/config/router/app_paths.dart';
import 'package:diary_emotional_frontend/features/home/ui/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <HomeCard>[
              HomeCard(
                title: 'Diario Emocional',
                description:
                    'Registra tus emociones que has sentido a lo largo de tu dia, con el fin de tener un control de tus emociones y diariamente ser mas consiente de ellas.',
                height: size.height / 3,
                imagePath: 'assets/images/diary.jpeg',
                onTap: () => context.push('${AppPaths.home}${AppPaths.diary}'),
              ),
              HomeCard(
                title: 'Emociones Trascendentales',
                description:
                    'Conoce tus emociones, creando registros de tus emociones mas relevantes, usa esta herramienta para guardar los momentos en los cuales te sientes mas emocionado o te cuesta saber que sentiste en el momento.',
                height: size.height / 3,
                imagePath: 'assets/images/trascendental.jpeg',
                onTap: () =>
                    context.push('${AppPaths.home}${AppPaths.transcendental}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}