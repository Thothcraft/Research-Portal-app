import 'package:freezed_annotation/freezed_annotation.dart';

part 'training.freezed.dart';
part 'training.g.dart';

@freezed
class TrainingJob with _$TrainingJob {
  const factory TrainingJob({
    @JsonKey(name: 'job_id') required String jobId,
    required String model,
    required String status,
    String? progress,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'best_accuracy') double? bestAccuracy,
    @JsonKey(name: 'current_epoch') int? currentEpoch,
    @JsonKey(name: 'total_epochs') int? totalEpochs,
    TrainingMetrics? metrics,
  }) = _TrainingJob;

  factory TrainingJob.fromJson(Map<String, dynamic> json) =>
      _$TrainingJobFromJson(json);
}

@freezed
class TrainingMetrics with _$TrainingMetrics {
  const factory TrainingMetrics({
    List<double>? loss,
    List<double>? accuracy,
    @JsonKey(name: 'val_loss') List<double>? valLoss,
    @JsonKey(name: 'val_accuracy') List<double>? valAccuracy,
  }) = _TrainingMetrics;

  factory TrainingMetrics.fromJson(Map<String, dynamic> json) =>
      _$TrainingMetricsFromJson(json);
}

@freezed
class TrainedModel with _$TrainedModel {
  const factory TrainedModel({
    @JsonKey(name: 'model_id') required String modelId,
    @JsonKey(name: 'model_name') required String modelName,
    required String architecture,
    double? accuracy,
    @JsonKey(name: 'size_mb') double? sizeMb,
    @JsonKey(name: 'device_id') String? deviceId,
    @JsonKey(name: 'num_clients') int? numClients,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _TrainedModel;

  factory TrainedModel.fromJson(Map<String, dynamic> json) =>
      _$TrainedModelFromJson(json);
}

@freezed
class TrainingConfig with _$TrainingConfig {
  const factory TrainingConfig({
    required String model,
    required String data,
    required String mode,
    @Default(10) int epochs,
    @JsonKey(name: 'batch_size') @Default(32) int batchSize,
    @JsonKey(name: 'learning_rate') @Default(0.001) double learningRate,
    @JsonKey(name: 'validation_split') @Default(0.2) double validationSplit,
    @JsonKey(name: 'device_id') String? deviceId,
  }) = _TrainingConfig;

  factory TrainingConfig.fromJson(Map<String, dynamic> json) =>
      _$TrainingConfigFromJson(json);
}
