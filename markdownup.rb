require 'sinatra'
require 'redcarpet'
require 'launchy'

markdown_renderer = Redcarpet::Render::HTML.new(prettify: true, no_styles: false)
markdown = Redcarpet::Markdown.new(markdown_renderer)
render_file = markdown.render( File.read ARGV[0] )

Launchy.open( "http://localhost:4567/" )

get('/') do
    render_file
end
