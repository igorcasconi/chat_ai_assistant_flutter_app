import 'package:chat_ai_flutter_app/models/chat_agent_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/foundation.dart';

class ChatService {
  static final String _apiKey = dotenv.get("GEMINI_API_KEY");

  final Map<String, ChatSession> _activeChats = {};

  final List<ChatAgent> availableAgents = const [
    ChatAgent(
      id: 'trips',
      title: '✈️ Mochileiro IA',
      systemInstruction: '''
Você é um agente de viagens de elite, chamado "Mochileiro IA". Sua especialidade 
é criar roteiros personalizados e dar dicas insider sobre destinos exóticos na Europa. 
Seu tom é entusiasmado e de aventura.

**Regras:**
1. Não aceitar mensagens que fogem do assunto sobre viagens, ser especifico nesse tema.
2. Inclua um fato histórico rápido sobre o destino.
3. O idioma principal das respostas deve ser o Português do Brasil.
''',
    ),
    ChatAgent(
      id: 'sports',
      title: '⚽ Craque Neto',
      systemInstruction: '''
Você é um comentarista esportivo e tem que ser no mesmo estilo de conversa do famoso ex-jogador "Craque Neto". Sua paixão é o futebol brasileiro. 
Mantenha um tom analítico, focado em estatísticas e táticas. Não responda perguntas fora do esporte.
''',
    ),
    ChatAgent(
      id: 'health',
      title: '💪 Dr. IA',
      systemInstruction: '''
Você é um especialista na área de saúde chamado "Dr. IA" e seu foco é sobre treinos de academia, alimentação, bem-estar e mais nessa área. Não responda perguntas fora dessa área da saúde.
''',
    ),
  ];

  ChatService() {
    if (_apiKey.isEmpty) {
      if (kDebugMode) {
        print('🚨 GeminiChatService: Chave de API não encontrada.');
      }
    }
  }

  ChatSession _getOrCreateChatSession(ChatAgent agent) {
    if (_activeChats.containsKey(agent.id)) {
      return _activeChats[agent.id]!;
    }

    final model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: _apiKey,
      systemInstruction: Content.system(agent.systemInstruction),
    );

    final newChat = model.startChat();
    _activeChats[agent.id] = newChat;

    if (kDebugMode) {
      print('✅ Nova sessão de chat iniciada para: ${agent.title}');
    }

    return newChat;
  }

  Future<String> sendMessage(String agentId, String message) async {
    try {
      final agent = availableAgents.firstWhere(
        (a) => a.id == agentId,
        orElse: () => throw Exception('Agente não encontrado: $agentId'),
      );

      final chat = _getOrCreateChatSession(agent);
      final responseStream = chat.sendMessageStream(Content.text(message));

      String fullResponse = '';
      await for (final chunk in responseStream) {
        fullResponse += chunk.text ?? '';
      }

      return fullResponse.trim();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Erro ao enviar mensagem para $agentId: $e');
      }
      return "Desculpe, meu sistema de IA encontrou um erro. Tente novamente mais tarde.";
    }
  }
}
