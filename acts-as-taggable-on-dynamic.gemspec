# coding: utf-8
require File.expand_path('../lib/acts_as_taggable_on_dynamic/rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "acts-as-taggable-on-dynamic"
  gem.version       = ActsAsTaggableOnDynamic::Rails::VERSION
  gem.authors       = ["Dirk Eisenberg"]
  gem.email         = ["dirk.eisenberg@gmail.com"]
  gem.description   = %q{With ActsAsTaggableOnDynamic, you can tag a single model on several contexts based on the ActsAsTaggableOn gem. This gem extends rails forms support.}
  gem.summary       = "Advanced tagging for Rails with forms and dynamic tags."
  gem.homepage      = 'https://github.com/dei79/acts-as-taggable-on-dynamic'
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  if File.exists?('UPGRADING')
    gem.post_install_message = File.read('UPGRADING')
  end

  gem.add_dependency "railties", "~> 3.1"
  gem.add_runtime_dependency 'acts-as-taggable-on'
  gem.add_runtime_dependency 'handlebars_assets'
  gem.add_runtime_dependency 'inflection-js-rails'

  gem.add_development_dependency 'rspec', '~> 2.6'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'mysql2', '~> 0.3.7'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
end
