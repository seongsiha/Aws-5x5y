resource "kubernetes_namespace" "shop" {
  metadata {
    name = "shop"
  }
}

resource "kubernetes_deployment" "shop" {
  metadata {
    name      = "shop"
    namespace = kubernetes_namespace.shop.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "shop"
      }
    }

    template {
      metadata {
        labels = {
          app = "shop"
        }
      }

      spec {
        container {
          name  = "shop"
          image = "your-ecr-url:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}