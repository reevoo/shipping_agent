require 'shipping_agent/procfile'

module ShippingAgent
  class Build
    def initialize(application:, tag: nil, procfile:)
      self.application = application
      self.tag = tag
      self.procfile = procfile
    end

    attr_reader :application, :procfile, :tag

    def processes
      Procfile.new(procfile).processes
    end

    def image
      "#{application.repo}:#{tag}"
    end

    protected

    attr_writer :application, :procfile, :tag

  end
end
