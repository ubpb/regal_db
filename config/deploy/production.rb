server "ubperseus", user: "ubpb", roles: %w{app web db}
server "ubpegasus", user: "ubpb", roles: %w{app web}
set :branch, "production"
set :deploy_to, "/ubpb/shelf-finder"