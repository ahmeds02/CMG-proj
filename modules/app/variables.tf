variable "app_name" {
  type        = string
  description = "The name of the application."
}

variable "app_image" {
  type        = string
  description = "The Docker image for the application."
}

variable "app_replicas" {
  type        = number
  description = "The number of replicas to run for the application."
}

variable "app_port" {
  type        = number
  description = "The port on which the application listens."
}

variable "app_env_vars" {
  type        = map(string)
  description = "A map of environment variables to set for the application."
}
