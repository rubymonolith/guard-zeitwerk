# frozen_string_literal: true

require_relative "zeitwerk/version"

require "guard"
require "guard/plugin"
require "zeitwerk"

module Guard
  class Zeitwerk < Plugin
    def initialize(options = {})
      super
      require options[:require] if options.key? :require
    end

    def start
      warn_zero_loaders
      detect_and_initialize_rails
    end

    def run_all
      # Called when running all Guards
    end

    def run_on_additions(paths)
      process(paths)
    end

    def run_on_modifications(paths)
      process(paths)
    end

    def stop
      # Called when Guard is stopped
    end

    protected

    def detect_and_initialize_rails
      Rails.initialize! if defined? Rails and not Rails.initialized?
    end

    def warn_zero_loaders
      if ::Zeitwerk::Registry.loaders.count.zero?
        UI.info "No Zeitwerk::Loader instances running. Make sure the file specified in the `require:` argument creates Zeitwerk::Loader instances."
      end
    end

    def process(paths)
      paths.each do |path|
        next unless File.zero?(path)

        ::Zeitwerk::Registry.loaders.each do |loader|
          namespace = loader.cpath_at(path)
          next if namespace.nil?

          *constant_names, object_name = namespace.split("::")
          module_name = constant_names.join("::")

          File.write path, <<~RUBY
            class #{namespace}
            end
          RUBY

          UI.info "Generated module namespace #{namespace} in #{path}"
        end
      end
    end
  end
end
