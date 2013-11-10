require 'safe_yaml'
require 'recursive-open-struct'

class SuperConfig < RecursiveOpenStruct
  def self.defaults
    return Hash.new
  end # def self.defaults

  def self.config_paths
    return [
      File.join('/etc',      "#{name}.yml"),
      File.join(ENV['HOME'], ".#{name}.yml"),
    ]
  end # def self.config_paths

  def self.env_map
    return Hash.new
  end # def self.env_map

  def self.load_config
    cfg = self.new(defaults)
    config_paths.select{ |f| File.exist?(f) }.each{ |f| cfg.update!(load_yaml_file(f)) }
    return cfg.update(load_environment)
  end # def self.load_config

  def self.load_environment
    hsh = Hash.new
    env_map.each{ |env_var, cfg_var| hsh[cfg_var] = ENV[env_var] if ENV.has_key?(env_var) }
    return self.new(hsh)
  end # def self.load_environment

  def self.load_yaml_file(file)
    return self.new(YAML.load_file(file, :safe => true, :deserialize_symbols => true))
  end # def self.load_yaml_file

  def self.name
    return self.to_s.split(/::/).last.downcase
  end # def self.name

  def each(&block)
    return self.class.new(self.to_h.each(&block))
  end # def each

  def each_setting(&block)
    return each(&block)
  end # def each_setting

  def map(&block)
    return self.class.new(self.to_h.map(&block))
  end # def map

  def merge(ostruct)
    return self.class.new(self.to_h.merge(ostruct.to_h))
  end # def merge

  def merge!(ostruct)
    hsh = self.to_h
    hsh.merge!(ostruct.to_h)
    hsh.each do |key, val|
      self.new_ostruct_member(key)
      self[key] = val
    end

    return self
  end # def merge!

  def update(ostruct)
    return merge(ostruct)
  end # def update

  def update!(ostruct)
    return merge!(ostruct)
  end # def update!
end # class SuperConfig

