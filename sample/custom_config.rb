#! /usr/bin/env ruby

require 'super-config'

class CustomConfig < SuperConfig
  def self.defaults
    return self.new({:foo => 'bar'})
  end # def self.defaults

  def self.env_map
    return {'CUSTOM_CONFIG_FOO' => :foo}
  end # def self.env_map

  def self.name
    return 'custom_config'
  end # def self.name
end # class CustomConfig

cfg = CustomConfig.load_config
puts cfg.inspect

