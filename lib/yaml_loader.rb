require 'yaml'

module YamlLoader

  def self.load(yaml_path)

    ruby_version = RUBY_VERSION.match(/^(?<major>\d+).(?<minor>\d+).(?<patch>\d+)$/)

    # FIX YAML parser can not work if ruby version < 2.0.0
    if ruby_version[:major].to_i < 2
      YAML::ENGINE.yamler = 'syck'
    end

    raise "File '#{yaml_path}' not exists" unless File.exist?(yaml_path)

    yaml_data = YAML::load(ERB.new(IO.read(yaml_path)).result)

    # parse yaml to a hash object and then return it
    HashWithIndifferentAccess.new(yaml_data)
  end

end