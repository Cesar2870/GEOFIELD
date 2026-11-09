import 'package:flutter/material.dart';

/// Paleta de cores oficial do GeoField.
/// Usamos "static const" para poder acessar as cores de qualquer lugar,
/// escrevendo apenas AppColors.primary, por exemplo.
class AppColors {
  // Construtor privado: impede que alguém crie "um AppColors".
  // Essa classe serve só para guardar as cores.
  AppColors._();

  static const Color primary = Color(0xFF234B3A);       // Verde principal
  static const Color primaryDark = Color(0xFF173D32);   // Verde escuro
  static const Color softGreen = Color(0xFFB7C9B0);     // Verde suave
  static const Color background = Color(0xFFEDF3EE);    // Fundo claro
  static const Color backgroundAlt = Color(0xFFF7F7F2); // Fundo alternativo
  static const Color textPrimary = Color(0xFF1F2723);   // Texto principal
  static const Color textSecondary = Color(0xFF68716C); // Texto secundário
  static const Color accent = Color(0xFFA9B86A);        // Destaque
}