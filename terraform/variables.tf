variable "domain_name" {
  type    = string
  default = "bugbear.fr"
}

variable "cloudflare_account_id" {
  type = string
}

variable "role_id" {
  type = string
}

variable "secret_id" {
  type = string
}

variable "minio_access_key" {
  type = string
}

variable "minio_secret_key" {
  type = string
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5nMQa36jQQ5UnFJAV91HEYqb9ue08wLYAre19dmgFfwIZNNaazYGRqSY6mwryL50cO0jcXiDTPEJmITFXkEG/NSI+fOFK+oOHLPr9n3vOotoZwxgPG5vwJIIkBczdJUZTndlxUcZpKQ4pikR0iCD77k1n/aRT1vBqgtmcOxuQb+cD4/evajJS1PadnrVIbKFk6qu+iz9wQ/AuK/pgY/tpyUYC7TCxweNEHKwEeXd64HgIujUJUtSeeySuAlzW6Nxsh/BdkAbS3iQ8sRqMf554+RZcGkSluhUO8REgOjEt6f19sWaqa9A9aXJgAPlldHtjUzHhl7vkpe4FA5gjc8p2OY9hriAB3A/4ESEnMzKTGiuzbDR5oLTJGOSn3If85rbu5/XAb5v/LtMGOxvMjRZQE8mMJ0Xdntlp+/IEPuM6twd9GicR6c0X5Vk900pObrMV+34E8d5ILra+6lf5NxrusvcWtV6K999i0etLhYJANv93H0P7CFFSEuFQsHKC018t0XXKHLr6WPRsjXcPe2SwYf3A6EKVTbZgIGJZLtFYDnodwP39DQBVztLovi+7kBmZwx70fr1XuYGeCEqtxC/XA2z5Sz4/UkcSQIvvgMaMKCNd15SwfNn+Jc2pPRohg9/J3kR11l1y+TsMkKuGwC1KMif0nt/Lz7CsAaPG536t7Q== cardno:22_486_624"
}

variable "hcloud_token" {
  type      = string
  sensitive = true
}

variable "cloudflare_token" {
  type      = string
  sensitive = true
}