server "ubpegasus18.upb.de", user: "ubpb", roles: %w{app web}
server "ubperseus18.upb.de", user: "ubpb", roles: %w{app web}
server "app1.ub.upb.de",     user: "ubpb", roles: %w{app web db}
server "app2.ub.upb.de",     user: "ubpb", roles: %w{app web}
set :branch, "production"
set :deploy_to, "/ubpb/regaldb"
