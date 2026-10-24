import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';

// Modelo de datos: módulos de La Sonora
class SonoraModule {
  final String title;
  final String description;
  final IconData icon;
  final String routeName;

  const SonoraModule({
    required this.title,
    required this.description,
    required this.icon,
    required this.routeName,
  });
}

// Punto de entrada principal
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LaSonoraApp());
}

// Widget raíz de la aplicación
class LaSonoraApp extends StatelessWidget {
  const LaSonoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reproductor La Sonora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.darkBrown,
        scaffoldBackgroundColor: AppColors.creamBeige,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryOrange,
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

// Pantalla principal
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<SonoraModule> _modules = [
    SonoraModule(
      title: 'Reproductor de Audio',
      description:
          'Control de pistas, ecualizador y cola de reproducción en tiempo real.',
      icon: Icons.music_note_rounded,
      routeName: '/player',
    ),
    SonoraModule(
      title: 'Biblioteca Musical',
      description:
          'Organización por álbumes, artistas, géneros y listas de favoritos.',
      icon: Icons.library_music_rounded,
      routeName: '/library',
    ),
    SonoraModule(
      title: 'Afinador Musical',
      description:
          'Detección de notas y frecuencia mediante micrófono del dispositivo (440 Hz).',
      icon: Icons.mic_rounded,
      routeName: '/tuner',
    ),
    SonoraModule(
      title: 'Metrónomo',
      description:
          'Definición de tempo en BPM y marcas de pulso visual/sonoro.',
      icon: Icons.timer_rounded,
      routeName: '/metronome',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'La Sonora | Reproductor & Herramientas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.darkBrown,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Panel Principal - Versión 1.0',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Seleccione un módulo para iniciar la experiencia artesanal de audio:',
                style: TextStyle(fontSize: 14, color: AppColors.mediumBrown),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _modules.length,
                  itemBuilder: (context, index) {
                    final module = _modules[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.primaryOrange.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                module.icon,
                                color: AppColors.primaryOrange,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    module.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textMain,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    module.description,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.mediumBrown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                                color: AppColors.darkBrown,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Accediendo a: ${module.title}'),
                                    duration: const Duration(seconds: 1),
                                    backgroundColor: AppColors.darkBrown,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
