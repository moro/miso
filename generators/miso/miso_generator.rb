
# This generates Japanized useful step definithions for Cucumber with Rails.
class MisoGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'features/step_definitions'
      %w[web_steps_ja.rb web_extra_ja_steps.rb].each do |step|
        m.file step, File.join('features/step_definitions', step)
      end
    end
  end

protected

  def banner
    "Usage: #{$0} miso"
  end

  def add_options!(opt)
    # do nothing at now
  end
end
