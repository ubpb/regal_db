server "stage.ub.upb.de", user: "ubpb", roles: %w{app db web}
set :deploy_to, "/ubpb/regaldb"
set :branch, "master"

