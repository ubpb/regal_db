server "ubperseus", user: "ubpb", roles: %w{app web db}
server "ubpegasus", user: "ubpb", roles: %w{app web}
set :branch, "production"
set :deploy_to, "/ubpb/regaldb"

set :rvm_ruby_version, "2.4.1"
