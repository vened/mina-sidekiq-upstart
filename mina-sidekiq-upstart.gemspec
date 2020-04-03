# -*- encoding: utf-8 -*-

require "./lib/mina_sidekiq_upstart/version.rb"

Gem::Specification.new do |s|
  s.name = "mina-sidekiq-upstart"
  s.version = MinaSidekiqUpstart.version
  s.authors = ["Максим Столбухин"]
  s.email = ["maxstbn@gmail.com"]
  s.homepage = "https://github.com/vened/mina-sidekiq-upstart"
  s.summary = "Tasks to deploy Sidekiq with mina."
  s.description = "Adds tasks to aid in the deployment of Sidekiq"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.post_install_message = <<-MESSAGE
Starting with 0.2.0, you have to add:

    require "mina_sidekiq_upstart/tasks"

in your deploy.rb to load the library
MESSAGE

  s.add_runtime_dependency "mina"
end
