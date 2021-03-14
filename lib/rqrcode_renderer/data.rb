# frozen_string_literal: true

require 'rqrcode_renderer/size_calculator'
require 'rqrcode'

module RqrcodeRenderer
  class Data
    class << self
      def build(string, format, options)
        size   = options[:size]  || RqrcodeRenderer::SizeCalculator.minimum_qr_size_from_string(string)
        level  = options[:level] || :h
        color  = options[:color] || '000000'
        offset = options[:offset] || 0

        qrcode = RQRCode::QRCode.new(string, size: size, level: level)

        svg = qrcode.as_svg(color: color, offset: offset)

        if format.to_s == 'svg'
          svg
        else
          image = MiniMagick::Image.read(svg) { |i| i.format 'svg' }
          image.format format
          image.to_blob
        end
      end
    end
  end
end
