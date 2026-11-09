import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Tela Início.
/// ATENÇÃO: todos os textos e números aqui são dados de EXEMPLO.
/// Na Etapa 4 eles passarão a vir do banco de dados.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Nome fixo, provisório. Depois virá do Perfil.
  static const String _userName = 'César';

  // Mensagem temporária enquanto as funcionalidades não existem.
  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature: disponível nas próximas etapas')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // SingleChildScrollView permite rolar a tela se o conteúdo
        // não couber (celulares menores).
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Cabeçalho: saudação + ícone de perfil ----
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olá, $_userName',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'O que você quer fazer hoje?',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.softGreen,
                    child: Icon(
                      Icons.person_outline,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ---- Levantamento em andamento ----
              _CurrentSurveyCard(
                title: 'Terreno — Piedade',
                info: '11 pontos · atualizado agora',
                onTap: () => _showComingSoon(context, 'Levantamento'),
              ),
              const SizedBox(height: 28),

              // ---- Acesso rápido (grade 2x2) ----
              const Text(
                'Acesso rápido',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 12),

              // IntrinsicHeight + stretch: faz os dois cards da linha
              // terem a mesma altura, mesmo com textos de tamanhos diferentes.
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.straighten,
                        title: 'Medir terreno',
                        subtitle: 'Pontos, área e perímetro',
                        onTap: () => _showComingSoon(context, 'Medir terreno'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.photo_camera_outlined,
                        title: 'Fotografar',
                        subtitle: 'Registrar evidências',
                        onTap: () => _showComingSoon(context, 'Fotografar'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.edit_note,
                        title: 'Registrar anotações',
                        subtitle: 'Observações do campo',
                        onTap: () =>
                            _showComingSoon(context, 'Registrar anotações'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.table_chart_outlined,
                        title: 'Compilar planilha',
                        subtitle: 'Organizar e exportar dados',
                        onTap: () =>
                            _showComingSoon(context, 'Compilar planilha'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // ---- Último levantamento ----
              _LastSurveyCard(
                title: 'Sítio Boa Vista',
                location: 'Vitória de Santo Antão · PE',
                info: '24 abr · 18 pontos coletados',
                onTap: () => _showComingSoon(context, 'Último levantamento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Card verde do levantamento em andamento.
class _CurrentSurveyCard extends StatelessWidget {
  final String title;
  final String info;
  final VoidCallback onTap;

  const _CurrentSurveyCard({
    required this.title,
    required this.info,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.softGreen,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Levantamento em andamento',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      info,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Botão redondo com seta.
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Card do "Acesso rápido": ícone, título e uma linha de explicação.
class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundAlt,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.softGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primaryDark, size: 22),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Card do último levantamento concluído.
class _LastSurveyCard extends StatelessWidget {
  final String title;
  final String location;
  final String info;
  final VoidCallback onTap;

  const _LastSurveyCard({
    required this.title,
    required this.location,
    required this.info,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundAlt,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Último levantamento',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                info,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}