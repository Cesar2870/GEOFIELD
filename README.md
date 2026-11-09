# GeoField

Aplicativo mobile para **coleta, medição e organização de informações de terrenos**, pensado para atividades de campo relacionadas à Agrimensura. O diferencial é funcionar **totalmente offline**: os dados são gravados no próprio celular e permanecem salvos mesmo sem internet. Quando houver conexão, eles poderão ser sincronizados com a nuvem pelo **Supabase**.

> **Aviso importante:** o GeoField não substitui equipamentos profissionais de levantamento topográfico nem serviços técnicos de Agrimensura. As medições feitas com o GPS convencional do celular são **estimativas**, não medições oficiais nem georreferenciamento certificado.

## Status do projeto

🚧 Em desenvolvimento (MVP em construção).

- [x] Estrutura inicial do projeto Flutter
- [x] Tema visual e tela inicial
- [x] Navegação inferior e nova tela Início
- [ ] Banco de dados local e levantamentos
- [ ] Registro de pontos GPS
- [ ] Cálculo de distância, perímetro e área
- [ ] Medir caminhando (trajetória por GPS)
- [ ] Anotações
- [ ] Fotografias
- [ ] Exportação CSV
- [ ] Integração com Supabase (login, backup e sincronização)

## Para quem é

- **Profissionais e estudantes de Agrimensura**, que precisam coletar pontos, registrar o perímetro e organizar levantamentos em campo.
- **Proprietários de terrenos**, que querem medições aproximadas de forma simples.

## Funcionalidades planejadas

- Criar e organizar levantamentos.
- Registrar pontos GPS com a precisão estimada de cada leitura.
- **Medir caminhando:** o app acompanha o percurso do usuário ao redor do terreno, com filtros configuráveis para reduzir o ruído do GPS.
- Medição por vértices, com registro manual dos cantos do terreno.
- Cálculo estimado de distância, perímetro e área.
- Anotações e fotografias associadas aos levantamentos e pontos.
- Exportação de dados em CSV, sem internet.
- Login de usuários, backup na nuvem e sincronização entre dispositivos com o Supabase.

## Arquitetura: offline primeiro

O GeoField segue a abordagem **offline-first**:

1. Toda a coleta e todos os cálculos acontecem no celular, e os dados são gravados no **SQLite local**, com ou sem internet.
2. O SQLite é a fonte de verdade do app no dispositivo.
3. Quando houver conexão, os dados ainda não enviados (controlados pelo campo `sync_status`) serão sincronizados com o **Supabase**.
4. As fotografias serão enviadas para o armazenamento do Supabase, e o banco guardará apenas a referência.
5. Os identificadores dos registros usam **UUID**, gerados no próprio celular, para evitar conflitos na sincronização entre dispositivos.

Por isso, nenhuma função de coleta ou cálculo depende de internet. O Supabase é a camada de login, backup e sincronização, e não um requisito para usar o app em campo.

## Tecnologias

- [Flutter](https://flutter.dev) e Dart
- [geolocator](https://pub.dev/packages/geolocator): GPS e permissões de localização
- [sqflite](https://pub.dev/packages/sqflite): banco de dados SQLite local
- `CustomPainter`: desenho do percurso e dos pontos
- [Supabase](https://supabase.com): autenticação, banco de dados na nuvem e armazenamento de arquivos (sincronização e backup)

## Como executar

Pré-requisitos: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e um dispositivo ou emulador configurado.

```bash
# 1. Clonar o repositório
git clone https://github.com/SEU_USUARIO/geofield.git
cd geofield

# 2. Baixar as dependências
flutter pub get

# 3. Executar o app
flutter run
```

Para testar a coleta de GPS, o ideal é usar um **celular real**, ao ar livre. O emulador consegue simular localizações, mas não reproduz a qualidade real do sinal de satélite.

### Configuração do Supabase

A integração com o Supabase ainda não foi implementada. Quando for, as credenciais do projeto **não serão enviadas ao repositório**. As instruções de configuração serão adicionadas aqui.

## Estrutura do projeto

```
lib/
├── main.dart        # ponto de entrada
├── app.dart         # configuração do app
├── theme/           # cores e tema visual
└── screens/         # telas do aplicativo
```

A estrutura será ampliada conforme o desenvolvimento (modelos, banco de dados, serviços etc.).

## Roadmap futuro

Depois da validação do MVP offline:

- Integração com Supabase: login, backup na nuvem e sincronização
- Mapas offline
- Compartilhamento de levantamentos
- Relatórios avançados em PDF
- Integração com equipamentos GNSS profissionais

## Autor

[Seu nome]
