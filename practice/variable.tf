resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"
    namespace = "fourth"

    labels {
      app = "nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "mounikavenna1281991/nginx"

          port {
            container_port = 80
          }
        }

      }
    }
  }
}

##############################resoure of nodejs##################
resource "kubernetes_deployment" "nodejs" {
  metadata {
    name = "nodejs"
    namespace = "fourth"

    labels {
      app = "nodejs"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "nodejs"
      }
    }

    template {
      metadata {
        labels {
          app = "nodejs"
        }
      }

      spec {
        container {
          name  = "nodejs"
          image = "mounikavenna1281991/nodejs"

          port {
            container_port = 3001
          }
        }

      }
    }
  }
}
##############################service file for nodejssvc#####################
resource "kubernetes_service" "nodejssvc" {
  metadata {
    name      = "nodejssvc"
    namespace = "fourth"
    labels {
      app = "nodejs"
    }
  }
  spec {
    port {
      name        = "nodejssvc"
      protocol    = "TCP"
      port        = 3001
      target_port = "3001"
    }
    selector {
      app = "nodejs"
    }
  }
} 

###########################service file for nginx#################################
resource "kubernetes_service" "svc" {
  metadata {
    name      = "svc"
    namespace = "fourth"
    labels {
      app = "nginx"
    }
  }

  spec {
    port {
      name        = "svc"
      protocol    = "TCP"
      port        = 80
      target_port = "80"
    }

    selector {
      app = "nginx"
    }

    type = "LoadBalancer"
  }
}



#################################################################
variable "project_id" {
  description = "The name of the project_id"
  default    = "applied-fusion-241610"
}

variable "region" {
  description = "The names of the project_region"
  default     = "us-east4"
}

variable "zones" {
  type        = "string"
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default = "us-east4-c"
}
variable "node_count" {
  type   = "string"
  description = "The number of nodes to create in this Node Pool"
  default = "1"
}
variable "cluster_name" {
  description = "Name of the cluster to which to add this Node Pool"
  default = "cloudseals"
}

variable "name" {
  type = "string"
  description = "Name of the node"
  default = "fourth"
}

variable "machine_type" {
  description = "The type of machine to use for nodes in the pool"
  default     = "n1-standard-1"
}

variable "disk_size_gb" {
  description = "Disk of which size to attach to the nodes in the pool "
  default     = "10"
}

variable "image_type" {
  description = "The image type to use for nodes. See supported image types https://cloud.google.com/kubernetes-engine/docs/concepts/node-images"
  default     = "COS"                                                                                                                             # Container-Optimized OS
}
    
