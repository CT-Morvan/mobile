# CT Morvan

Aplicativo para acompanhamento dos resultados de treinos em uma academia. Com ele, é possível registrar, visualizar e monitorar a evolução dos treinos dos alunos, facilitando o controle e o acompanhamento do desempenho ao longo do tempo.

## Como rodar o projeto

1. Instale as dependências:
   ```sh
   flutter pub get
   ```

2. Gere os arquivos necessários:
   ```sh
   dart packages pub run build_runner build --delete-conflicting-outputs
   ```

3. Rode o projeto:
   ```sh
   flutter run
   ```

4. Para gerar o APK de release:
   ```sh
   flutter build apk --release
   ```
