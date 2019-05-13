provider "google" {
  credentials = "${file("${var.credentials}")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

terraform {
  backend "gcs" {
    bucket  = "mdcloud-tf-state"
    prefix  = "terraform/gke"
  }
}

variable "swarm_workers_instance_type" {
    default = "n1-standard-1"
}

variable "zone" {
    default = "australia-southeast1-a"
}



variable "image_name" {
    default = "ubuntu-1804-lts"
}



variable "ssh_user" {
    default = "swarm"
}



variable "ssh_pub_key_file" {
    default = "/home/aaron/.ssh/id_rsa.pub"
}



variable "region" {
    default = "asia-southeast1"
}



variable "credentials" {
    default = "/home/aaron/Downloads/mdcloud-30f443044aae.json"
}



variable "project" {
    default = "mdcloud"
}


variable "swarm_managers_instance_type" {
    default = "n1-standard-1"
}



variable "swarm_managers" {
    default = 0
}


variable "swarm_workers" {
    default = 0
}