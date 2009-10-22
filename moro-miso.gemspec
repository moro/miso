# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{moro-miso}
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["MOROHASHI Kyosuke"]
  s.date = %q{2009-10-22}
  s.default_executable = %q{miso-cheat}
  s.description = %q{dip cukes into me.}
  s.email = %q{moronatural@gmail.com}
  s.executables = ["miso-cheat"]
  s.extra_rdoc_files = ["README.rdoc", "ChangeLog"]
  s.files = ["README.rdoc", "ChangeLog", "Rakefile", "lib/miso.rb", "rails_generators/miso/miso_generator.rb", "rails_generators/miso/templates/web_extra_ja_steps.rb", "rails_generators/miso/templates/webrat_ja_steps.rb", "bin/miso-cheat"]
  s.homepage = %q{http://github.com/moro/miso/}
  s.rdoc_options = ["--title", "moro-miso documentation", "--charset", "utf-8", "--opname", "index.html", "--line-numbers", "--main", "README.rdoc", "--inline-source", "--exclude", "^(examples|extras)/"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{dip cukes into me.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
