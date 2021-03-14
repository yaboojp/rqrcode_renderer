# frozen_string_literal: true

require 'rqrcode_renderer/version'
require 'rqrcode_renderer/data'
require 'action_controller'

module RqrcodeRenderer
  Mime::Type.register 'image/svg+xml', :svg  unless Mime::Type.lookup_by_extension(:svg)
  Mime::Type.register 'image/png',     :png  unless Mime::Type.lookup_by_extension(:png)
  Mime::Type.register 'image/jpeg', :jpeg unless Mime::Type.lookup_by_extension(:jpeg)
  Mime::Type.register 'image/gif', :gif unless Mime::Type.lookup_by_extension(:gif)

  ActionController::Renderers.add :qrcode do |string, options|
    data = RqrcodeRenderer::Data.build(string, request.format.symbol, options)
    self.response_body = render_to_string(plain: data, template: nil)
  end
end
