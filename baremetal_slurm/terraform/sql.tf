resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "master" {
  name = "master-instance-${random_id.db_name_suffix.hex}"
  database_version = "MYSQL_5_7"
  region = ${region}

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "users" {
  name      = "users-db"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "latin1"
  collation = "latin1_swedish_ci"
}


resource "google_sql_user" "users" {
  name     = "slurm"
  instance = "${google_sql_database_instance.master.name}"
  host     = "me.com"
  password = "changeme"
}