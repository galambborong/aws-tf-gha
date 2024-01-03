variable "bucket_name" {
  type    = string
  default = "my-tf-test-bucket-pk-test"
}

variable "snd_bucket_name" {
  type = string
}

variable "third_bucket_name" {
  description = "desc"
}

variable "env" {
  type        = string
  description = "target deployment environment"
}
