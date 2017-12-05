# Patch for s/Fixnum/Integer/

require 'nokogiri'
require 'nokogiri/html'

abort "This is for 1.6.8.1 but got: '#{Nokogiri::VERSION}'" if Nokogiri::VERSION != '1.6.8.1'

module Nokogiri
  module HTML
    class Document < Nokogiri::XML::Document
      class << self
        ###
        # Parse HTML.  +string_or_io+ may be a String, or any object that
        # responds to _read_ and _close_ such as an IO, or StringIO.
        # +url+ is resource where this document is located.  +encoding+ is the
        # encoding that should be used when processing the document. +options+
        # is a number that sets options in the parser, such as
        # Nokogiri::XML::ParseOptions::RECOVER.  See the constants in
        # Nokogiri::XML::ParseOptions.
        def parse string_or_io, url = nil, encoding = nil, options = XML::ParseOptions::DEFAULT_HTML

          options = Nokogiri::XML::ParseOptions.new(options) if Integer === options # THIS PART IS MODIFIED BY rails-benchmarks s/Fixnum/Integer/
          # Give the options to the user
          yield options if block_given?

          if string_or_io.respond_to?(:encoding)
            unless string_or_io.encoding.name == "ASCII-8BIT"
              encoding ||= string_or_io.encoding.name
            end
          end

          if string_or_io.respond_to?(:read)
            url ||= string_or_io.respond_to?(:path) ? string_or_io.path : nil
            unless encoding
              # Libxml2's parser has poor support for encoding
              # detection.  First, it does not recognize the HTML5
              # style meta charset declaration.  Secondly, even if it
              # successfully detects an encoding hint, it does not
              # re-decode or re-parse the preceding part which may be
              # garbled.
              #
              # EncodingReader aims to perform advanced encoding
              # detection beyond what Libxml2 does, and to emulate
              # rewinding of a stream and make Libxml2 redo parsing
              # from the start when an encoding hint is found.
              string_or_io = EncodingReader.new(string_or_io)
              begin
                return read_io(string_or_io, url, encoding, options.to_i)
              rescue EncodingFound => e
                encoding = e.found_encoding
              end
            end
            return read_io(string_or_io, url, encoding, options.to_i)
          end

          # read_memory pukes on empty docs
          if string_or_io.nil? or string_or_io.empty?
            return encoding ? new.tap { |i| i.encoding = encoding } : new
          end

          encoding ||= EncodingReader.detect_encoding(string_or_io)

          read_memory(string_or_io, url, encoding, options.to_i)
        end
      end
    end
  end
end
