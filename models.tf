data "aws_bedrock_foundation_model" "custom_model" {
  model_id = "amazon.titan-text-express-v1"
}
output "id" {
  value = "test-bedrock"
}

resource "aws_s3_bucket" "training" {
  bucket = "bedrock-test-storage-folder"
}

resource "aws_bedrock_custom_model" "custom_model" {
  custom_model_name     = "bedrock-aws-u-ai"
  job_name              = "bedrock-aws-u-ai-job"
  base_model_identifier = data.aws_bedrock_foundation_model.custom_model.model_arn
  role_arn              = aws_iam_role.example.arn

  hyperparameters = {
    "epochCount"              = "1"
    "batchSize"               = "1"
    "learningRate"            = "0.005"
    "learningRateWarmupSteps" = "0"
  }
  output_data_config {
  s3_uri = "s3://${aws_s3_bucket.training.id}/data/"
  }
  training_data_config {
    s3_uri = "s3://bedrock-test-storage-folder/training-data-folder/train.jsonl"
  }

}
