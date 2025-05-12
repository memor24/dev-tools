# to be exported as environment variable: export TF_VAR_token="the_github_token"
variable token {
  description = "GitHub token"
  type        = string
  sensitive   = true
}
