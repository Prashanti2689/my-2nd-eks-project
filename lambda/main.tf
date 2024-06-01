# Lambda Layer
resource "aws_lambda_layer_version" "numpy_layer" {
  layer_name = "numpy_layer"
  filename   = "C:\\Users\\DELL\\Desktop\\Prashanti\\EKS\\prashanti-eks-cicd-project\\layer.zip"
  compatible_runtimes = ["python3.8"]
}

# Lambda Function
resource "aws_lambda_function" "my_lambda_function" {
  filename         = "C:\\Users\\DELL\\Desktop\\Prashanti\\EKS\\prashanti-eks-cicd-project\\my-2nd-eks-project\\lambda_function.zip"
  function_name    = "myLambdaFunction"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"


  
  # Attach the Lambda layer
  layers = [aws_lambda_layer_version.numpy_layer.arn]
}

# IAM Role for Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Sid    = "",
        Principal = {
          Service = "lambda.amazonaws.com",
        },
      },
    ],
  })
}

# Attach the policy for Lambda execution
resource "aws_iam_role_policy_attachment" "lambda_exec_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
