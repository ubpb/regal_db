server "ubpegasus18", user: "ubpb", roles: %w{app web db}
#server "ubperseus18", user: "ubpb", roles: %w{app web}
set :branch, "new-cluster"
set :deploy_to, "/ubpb/regaldb"
