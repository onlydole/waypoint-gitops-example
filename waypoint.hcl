project = "waypoint-gitops-example"

app "waypoint-gitops-example" {
  labels = {
    "service" = "waypoint-gitops-example",
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
