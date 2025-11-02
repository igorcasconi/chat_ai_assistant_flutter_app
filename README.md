# 📱 Aplicativo Flutter - Chat IA com Gemini (Assistente com temas específicos)

[](https://github.com/igorcasconi/chat_ai_assistant_flutter_app#-aplicativo-flutter---chat-ia-com-gemini-assistente-com-temas-espec%C3%ADficos)

Este projeto é um aplicativo desenvolvido em Flutter em que você possui um Assistente para temas específicos (Esportes, viagens e saúde). Então para receber ajuda e tirar dúvidas com o assistente escolhido você acessa a sala de chat com cada um deles.

O app utiliza as seguintes tecnologias:

- 🔐 [Dotenv](https://pub.dev/packages/flutter_dotenv) para gerenciar variáveis de ambiente de forma segura.
- ☁️ [Firebase Firestore](https://console.firebase.google.com/) banco de dados em realtime (Firestore).
- ☁️ [Firebase Crashlytics](https://console.firebase.google.com/) SDK para pegar possíveis erros no app.
- ☁️ [Firebase Analytics](https://console.firebase.google.com/) SDK de análise de dados sobre o uso do app.
- [Provider](https://pub.dev/packages/provider) Gerenciamento de estado do aplicativo.
- [SharedPreferences](https://pub.dev/packages/shared_preferences) Armazenamento de dados locais.
- ☁️ [Google Gemini - Generative IA](https://aistudio.google.com/) SDK da Google Gemini para uso da API de IA.

---

## 🚀 Funcionalidades

[](https://github.com/igorcasconi/chat_ai_assistant_flutter_app#-funcionalidades)

- 💾 Registrar seu nome de usuário: insira seu nome de usuário para iniciar seus chats.
- 🚪 Acessar as salas de chat: Acesse a sala escolhida para falar sobre Esportes, Viagens ou Saúde.
- 💬 Converse com a IA: Tire suas dúvidas com a IA.
- 🗑️ Limpe o chat: Apague o histórico de conversa e inicie um novo chat totalmente limpo.
- ❌ Trocar seu nome: Faça o "Logout" e pode iniciar o app com um outro nome de usuário.

---

## 🛠️ Tecnologias Utilizadas

[](https://github.com/igorcasconi/chat_ai_assistant_flutter_app#%EF%B8%8F-tecnologias-utilizadas)

- Flutter (SDK cross-platform)
- Dart (linguagem de programação)
- Dotenv (variáveis de ambiente)
- Firebase (backend e banco de dados)
- Provider (Gerenciador de estado)
- Markdown (Widget para receber as repostas do chat com MD)
- SpinKit (Widgets de loader)
- uuid (Gerador de uuid para o usuário)
- Google Generative IA (IA para uso do chat)

---

## Screenshots

[](https://github.com/igorcasconi/chat_ai_assistant_flutter_app#screenshots)

[![Simulator Screenshot - iPhone 14 Pro Max - 2025-11-02 at 11 23 04](https://private-user-images.githubusercontent.com/37385365/508723168-36c169ac-08e8-4548-9470-8955b1b931f7.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjIwOTkyNDksIm5iZiI6MTc2MjA5ODk0OSwicGF0aCI6Ii8zNzM4NTM2NS81MDg3MjMxNjgtMzZjMTY5YWMtMDhlOC00NTQ4LTk0NzAtODk1NWIxYjkzMWY3LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTExMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMTAyVDE1NTU0OVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTI2NWIyMmRhZGQ3ODFjMzRlYjg5NTFlNjYwODRlYzc5ZWMyODM3NmRkOGZiMDk4ZTQyNzlmMWZlNTU1MzA5NDYmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.qpNv2Wx4GXdJxj8TuqfB3zCtt0SLIioN3RQ2K-u6t4I)](https://private-user-images.githubusercontent.com/37385365/508723168-36c169ac-08e8-4548-9470-8955b1b931f7.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjIwOTkyNDksIm5iZiI6MTc2MjA5ODk0OSwicGF0aCI6Ii8zNzM4NTM2NS81MDg3MjMxNjgtMzZjMTY5YWMtMDhlOC00NTQ4LTk0NzAtODk1NWIxYjkzMWY3LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTExMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMTAyVDE1NTU0OVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTI2NWIyMmRhZGQ3ODFjMzRlYjg5NTFlNjYwODRlYzc5ZWMyODM3NmRkOGZiMDk4ZTQyNzlmMWZlNTU1MzA5NDYmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.qpNv2Wx4GXdJxj8TuqfB3zCtt0SLIioN3RQ2K-u6t4I) [![Simulator Screenshot - iPhone 14 Pro Max - 2025-11-02 at 12 54 44](https://private-user-images.githubusercontent.com/37385365/508723185-91e178ec-6d7e-44e5-94de-6731b71c7f21.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjIwOTkyNDksIm5iZiI6MTc2MjA5ODk0OSwicGF0aCI6Ii8zNzM4NTM2NS81MDg3MjMxODUtOTFlMTc4ZWMtNmQ3ZS00NGU1LTk0ZGUtNjczMWI3MWM3ZjIxLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTExMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMTAyVDE1NTU0OVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTIyMzJiMmMzOGRjOTRhNTA2YWE0MWU3ZGEzNGIxNTExMTA3NDJjNzAxY2RlYjY2NDBlM2VlZTg3ZjU2MjRiMjUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.bLOWrq8mv6-kHluYHlbjlw8ptTDDZlHAKQfEdfjw5rI)](https://private-user-images.githubusercontent.com/37385365/508723185-91e178ec-6d7e-44e5-94de-6731b71c7f21.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjIwOTkyNDksIm5iZiI6MTc2MjA5ODk0OSwicGF0aCI6Ii8zNzM4NTM2NS81MDg3MjMxODUtOTFlMTc4ZWMtNmQ3ZS00NGU1LTk0ZGUtNjczMWI3MWM3ZjIxLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTExMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMTAyVDE1NTU0OVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTIyMzJiMmMzOGRjOTRhNTA2YWE0MWU3ZGEzNGIxNTExMTA3NDJjNzAxY2RlYjY2NDBlM2VlZTg3ZjU2MjRiMjUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.bLOWrq8mv6-kHluYHlbjlw8ptTDDZlHAKQfEdfjw5rI) [![Simulator Screenshot - iPhone 14 Pro Max - 2025-11-02 at 11 28 34](https://private-user-images.githubusercontent.com/37385365/508723196-1a7bad9b-d1b8-44ee-885a-a4f000916826.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjIwOTkyNDksIm5iZiI6MTc2MjA5ODk0OSwicGF0aCI6Ii8zNzM4NTM2NS81MDg3MjMxOTYtMWE3YmFkOWItZDFiOC00NGVlLTg4NWEtYTRmMDAwOTE2ODI2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTExMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMTAyVDE1NTU0OVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTBlY2ZkYmYzOGVmYmEwYTNiOTJmZjU0YmIxZTQxNWY3OGMwNjFiNzM5YTBmOWU4YWRlYmVkZDJhMzFlNTZkZGQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.Md9oeFmfPgLzChz1noVQGvIiF7VZFFvL90tZUuVv0oU)](https://private-user-images.githubusercontent.com/37385365/508723196-1a7bad9b-d1b8-44ee-885a-a4f000916826.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjIwOTkyNDksIm5iZiI6MTc2MjA5ODk0OSwicGF0aCI6Ii8zNzM4NTM2NS81MDg3MjMxOTYtMWE3YmFkOWItZDFiOC00NGVlLTg4NWEtYTRmMDAwOTE2ODI2LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTExMDIlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMTAyVDE1NTU0OVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTBlY2ZkYmYzOGVmYmEwYTNiOTJmZjU0YmIxZTQxNWY3OGMwNjFiNzM5YTBmOWU4YWRlYmVkZDJhMzFlNTZkZGQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.Md9oeFmfPgLzChz1noVQGvIiF7VZFFvL90tZUuVv0oU)
