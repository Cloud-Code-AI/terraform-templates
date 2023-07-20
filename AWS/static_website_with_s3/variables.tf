variable "region" {
    type = string
    description = "AWS region to deploy in"
}

variable "bucket_name" {
    type = string
    description = "Name of the bucket you are deploying"
}

variable "index_file_path" {
    type = string
    description = "Index file name"
  
}

variable "error_file_path" {
    type = string
    description = "Error file path"
    default = "error.html"
  
}