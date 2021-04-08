project = "waypoint-gitops"

runner {
  enabled = true
  poll {
    enabled = true
    interval = "30s"
  }
  data_source "git" {
    url  = "https://github.com/onlydole/waypoint-gitops-example.git"
  }
}

app "waypoint-gitops" {
  labels = {
    "service" = "waypoint-gitops",
    "env"     = "dev"
  }

  build {
    use "pack" {}
    registry {
      use "aws-ecr" {
        region     = "us-west-2"
        repository = "waypoint-example"
        tag        = "latest"
      }
    }
  }

  deploy {
    use "aws-ecs" {
      region = "us-west-2"
      memory = "512"
    }
  }
}
