server "198.211.110.159", user: "kevin", roles: %w{web app}, primary: true

set :deploy_to, "/home/kevin/admin.10kislands.com"

set :linked_dirs, fetch(:linked_dirs, []).push("public/system")
