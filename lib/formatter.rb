require 'forwardable'
require 'json'

class Formatter
  extend Forwardable

  attr_reader :robot, :format

  def initialize(options)
    @robot = options[:robot]
    @format = options[:format] || default_format
  end

  def message
    available_formats[format]
  end

  private

  def_delegators :robot, :row, :column, :direction

  def default_format
    'TEXT'
  end

  def available_formats
    { 'TEXT' => text_message, 'JSON' => json_message, 'HTML' => html_message }
  end

  def text_message
    "#{row},#{column},#{direction}"
  end

  def json_message
    { row: row, column: column, direction: direction }.to_json
  end

  def html_message
    <<~HTML
      <div>
        <p>row: #{row}</p>
        <p>column: #{column}</p>
        <p>direction: #{direction}</p>
      </div>
    HTML
  end
end
