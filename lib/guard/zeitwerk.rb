# frozen_string_literal: true

require_relative "zeitwerk/version"

require 'guard'
require 'guard/plugin'

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

        ::Zeitwerk::Registry.each do |loader|
          namespace = loader.cpath_at(path)
          next if namespace.nil?

          content = "module #{namespace}\n\nend"
          File.write(path, content)

          UI.info "Generated module namespace #{namespace} in #{path}"
        end
      end
    end
  end
end
