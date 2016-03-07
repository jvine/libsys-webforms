server 'libsys-webforms-stage.stanford.edu', user: 'libsys', roles: %w{app db web}

Capistrano::OneTimeKey.generate_one_time_key!
set :rails_env, 'staging'

set :delayed_job_workers, 4
