# Render QR codes easily from your Rails application

This gem supports rendering either SVG or PNG, JPEG, and GIF formats.


## Installation

Add the following to your `Gemfile`.

```ruby
gem 'rqrcode_renderer'
```

If you want to use the PNG, JPEG or GIF format, you will have to have **ImageMagick** installed on your system.
You will also want to add the **mini_magick** gem to your application's `Gemfile`.

```ruby
gem 'mini_magick'
```

## Usage

In your controller actions, you could return a QR code that links to the current page like this:

```ruby
respond_to do |format|
  format.svg  { render qrcode: 'http://example.com/', offset: 10, color: 'FF0000' }
  format.png  { render qrcode: 'http://example.com/' }
  format.gif  { render qrcode: 'http://example.com/' }
  format.jpeg { render qrcode: 'http://example.com/' }
end
```

#### Options:

* `size`   – This controls how big the QR Code will be. Smallest size will be chosen by default. Set to maintain consistent size.
* `level`  – The error correction level, can be:
  * Level `l` 7%  of code can be restored
  * Level `m` 15% of code can be restored
  * Level `q` 25% of code can be restored
  * Level `h` 30% of code can be restored (default :h)
* `offset` – Padding around the QR Code (e.g. 10)
* `color`  – Foreground color for the code (e.g. "000000" or :black)

## About

This project was inspired by [rqrcode-rails3](https://github.com/samvincent/rqrcode-rails3) that is no longer maintained.


QR codes are encoded by [rqrcode](https://github.com/whomwah/rqrcode)
