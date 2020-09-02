#storage "raft" {
#  path    = "./vault/data"
#  node_id = "node1"
#}

storage "mysql" {
  address = "127.0.0.1:3306"
  username = "root"
  password = "mysql"
  database = "test"
}

listener "tcp" {
  address     = "127.0.0.1:8200"
  tls_disable = 1 
scheme = "http"
}


api_addr = "http://127.0.0.1:8200"
cluster_addr = "http://127.0.0.1:8201"
ui = true


