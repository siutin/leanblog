
conf = YamlLoader.load(File.join(Rails.root, 'config', 'config.secret.yml'))

raise "unknown rails environment" if conf[Rails.env].nil?

ENV['LEANBLOG_DATABASE_PASSWORD'] = conf[Rails.env]['leanblog.database.password']
ENV['LEANBLOG_DATABASE_USERNAME'] = conf[Rails.env]['leanblog.database.username']

raise "config.secret.yml: 'leanblog.database.password' is missed" if ENV['LEANBLOG_DATABASE_PASSWORD'].blank?
raise "config.secret.yml: 'leanblog.database.username' is missed" if ENV['LEANBLOG_DATABASE_USERNAME'].blank?

if Rails.env.production?
  ENV['LEANBLOG_SECRET_KEY_BASE'] = conf[Rails.env]['leanblog.secret_key_base']

  raise "config.secret.yml: 'leanblog.secret_key_base' is missed" if ENV['LEANBLOG_SECRET_KEY_BASE'].blank?
end


