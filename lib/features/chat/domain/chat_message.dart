import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String text,
    required String sender, // 'user' or 'ai'
    required DateTime timestamp,
    @Default(false) bool isError,
    String? chatId,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

@freezed
class ChatRequest with _$ChatRequest {
  const factory ChatRequest({
    required String query,
    @JsonKey(name: 'chat_id') String? chatId,
    @Default('gpt-3.5-turbo') String model,
    @JsonKey(name: 'max_tokens') @Default(1024) int maxTokens,
    @Default(0.7) double temperature,
  }) = _ChatRequest;

  factory ChatRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestFromJson(json);
}

@freezed
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    required String response,
    @JsonKey(name: 'chat_id') String? chatId,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}
