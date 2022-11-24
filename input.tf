variable "pagerules" {
  value       = map(any)
  default     = {}
  description = "The configuration of the pagerules according to the format of example"
}