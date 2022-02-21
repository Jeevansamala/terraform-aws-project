resource "aws_key_pair" "awsprojectkey" {
  key_name = "awsprojectkey"
  public_key = file(var.PUB_KEY_PATH)
}