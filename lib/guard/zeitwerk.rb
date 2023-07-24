# frozen_string_literal: true

require_relative "zeitwerk/version"

require "guard"
require "guard/plugin"
require "zeitwerk"

module Guard
  class Zeitwerk < Plugin
    def initialize(options = {})
      super
      # Additional initialization options, if needed
    end

    def start
      # Called when Guard starts
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

    def process(paths)
      paths.each do |path|
        next unless File.zero?(path)

        ::Zeitwerk::Registry.loaders.each do |loader|
          namespace = loader.cpath_at(path)
          next if namespace.nil?

          *constant_names, object_name = namespace.split("::")
          module_name = constant_names.join("::")

          File.write path, <<~RUBY
            module #{module_name}
              class #{object_name}
              end
            end
          RUBY

          UI.info "Generated module namespace #{namespace} in #{path}"
        end
      end
    end
  end
end
