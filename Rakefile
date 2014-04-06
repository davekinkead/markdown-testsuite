#require "bundler/gem_tasks"
require 'rake'

task default: [:specs]

namespace :specs do
  $LOAD_PATH.unshift('lib', 'specs')
  Dir.glob('specs/**/*spec.rb').each { |file| require_relative file }
end