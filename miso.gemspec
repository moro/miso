# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{miso}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["MOROHASHI Kyosuke"]
  s.date = %q{2009-05-25}
  s.description = %q{dip cukes into me.}
  s.email = %q{moronatural@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "ChangeLog"]
  s.files = ["README.rdoc", "ChangeLog", "Rakefile", "lib/miso", "lib/miso.rb", "rails_generators/miso", "rails_generators/miso/miso_generator.rb", "rails_generators/miso/templates", "rails_generators/miso/templates/web_extra_ja_steps.rb", "rails_generators/miso/templates/webrat_ja_steps.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/moro/miso/}
  s.rdoc_options = ["--title", "miso documentation", "--charset", "utf-8", "--opname", "index.html", "--line-numbers", "--main", "README.rdoc", "--inline-source", "--exclude", "^(examples|extras)/"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{dip cukes into me.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
