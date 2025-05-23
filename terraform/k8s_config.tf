resource "kubernetes_config_map" "todoapp_config" {
  metadata {
    name = "todoapp-config"
  }
  data = {
    APP_NAME                 = "Todo API"
    ENV                     = "development"
    SPRING_DATASOURCE_URL   = "jdbc:postgresql://postgres-service:5432/mytodo"
    SPRING_DATASOURCE_USERNAME = "postgres"
  }
}

resource "kubernetes_secret" "todoapp_secret" {
  metadata {
    name = "todoapp-secret"
  }
  data = {
    SPRING_DATASOURCE_PASSWORD = base64encode("password")
  }
  type = "Opaque"
}
resource "kubernetes_deployment" "todoapp" {
  metadata {
    name = "todoapp-deployment"
    labels = {
      app = "todoapp"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "todoapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "todoapp"
        }
      }

      spec {
        container {
          name  = "todoapp"
          image = "chichia/mytodoapp:latest"

          port {
            container_port = 8292
          }

          env_from {
            config_map_ref {
              name = kubernetes_config_map.todoapp_config.metadata[0].name
            }
          }

          env_from {
            secret_ref {
              name = kubernetes_secret.todoapp_secret.metadata[0].name
            }
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "todoapp_service" {
  metadata {
    name = "todoapp-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.todoapp.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 8292
    }
    type = "NodePort"
  }
}

resource "kubernetes_ingress" "todoapp_ingress" {
  metadata {
    name = "todoapp-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      host = "todoapp.local"
      http {
        path {
          path = "/"

          backend {
            service_name = kubernetes_service.todoapp_service.metadata[0].name
            service_port = 80
          }
        }
      }
    }
  }
}
