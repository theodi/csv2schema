module Csv2schema
  class Validator < Csvlint::Validator

      def build_formats(row)
        row.each_with_index do |col, i|
          next if col.nil? || col.empty?
          @formats[i] ||= Hash.new(0)

        #  require "pry" ; binding.pry

          format =
              if float?(col)
                :float
              elsif col.strip[FORMATS[:boolean]]
                :boolean
              elsif uri?(col)
                :uri
              elsif possible_date?(col)
                date_formats(col)
              elsif col.strip[FORMATS[:numeric]]
                :numeric
              else
                :string
              end

          @formats[i][format] += 1
        end
      end

      def float?(col)
        Float(col).to_s == col rescue false
      end

      def date_formats(col)
        if col[FORMATS[:date_db]] && date_format?(Date, col, '%Y-%m-%d')
          :date_db
        elsif col[FORMATS[:date_short]] && date_format?(Date, col, '%e %b')
          :date_short
        elsif col[FORMATS[:date_rfc822]] && date_format?(Date, col, '%e %b %Y')
          :date_rfc822
        elsif col[FORMATS[:date_long]] && date_format?(Date, col, '%B %e, %Y')
          :date_long
        elsif col[FORMATS[:dateTime_time]] && date_format?(Time, col, '%H:%M')
          :dateTime_time
        elsif col[FORMATS[:dateTime_hms]] && date_format?(Time, col, '%H:%M:%S')
          :dateTime_hms
        elsif col[FORMATS[:dateTime_db]] && date_format?(Time, col, '%Y-%m-%d %H:%M:%S')
          :dateTime_db
        elsif col[FORMATS[:dateTime_iso8601]] && date_format?(Time, col, '%Y-%m-%dT%H:%M:%SZ')
          :dateTime_iso8601
        elsif col[FORMATS[:dateTime_short]] && date_format?(Time, col, '%d %b %H:%M')
          :dateTime_short
        elsif col[FORMATS[:dateTime_long]] && date_format?(Time, col, '%B %d, %Y %H:%M')
          :dateTime_long
        elsif col[FORMATS[:date_month]] && date_format?(Date, col, '%Y-%m')
          :date_month
        elsif col.strip[FORMATS[:numeric]]
          :numeric
        else
          :string
        end
      end

      FORMATS = {
        :string => nil,
        :numeric => /\A[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?\z/,
        :uri => /\Ahttps?:/,
        :boolean => /\Atrue\z|\Afalse\z|\Ay\z|\An\z|\Ayes\z|\Ano\z|\A1\z|\A0\z/i,
        :date_year => /\A\d{4,}\z/,                                                       # 12345
        :date_month => /\A\d{4,}-\d{2,}\z/,                                               # 12345-02
        :date_db => /\A\d{4,}-\d\d-\d\d\z/,                                               # "12345-01-01"
        :date_long => /\A(?:#{Date::MONTHNAMES.join('|')}) [ \d]\d, \d{4,}\z/,            # "January  1, 12345"
        :date_rfc822 => /\A[ \d]\d (?:#{Date::ABBR_MONTHNAMES.join('|')}) \d{4,}\z/,      # " 1 Jan 12345"
        :date_short => /\A[ \d]\d (?:#{Date::ABBR_MONTHNAMES.join('|')})\z/,              # "1 Jan"
        :dateTime_db => /\A\d{4,}-\d\d-\d\d \d\d:\d\d:\d\d\z/,                            # "12345-01-01 00:00:00"
        :dateTime_hms => /\A\d\d:\d\d:\d\d\z/,                                            # "00:00:00"
        :dateTime_iso8601 => /\A\d{4,}-\d\d-\d\dT\d\d:\d\d:\d\dZ\z/,                      # "12345-01-01T00:00:00Z"
        :dateTime_long => /\A(?:#{Date::MONTHNAMES.join('|')}) \d\d, \d{4,} \d\d:\d\d\z/, # "January 01, 12345 00:00"
        :dateTime_short => /\A\d\d (?:#{Date::ABBR_MONTHNAMES.join('|')}) \d\d:\d\d\z/,   # "01 Jan 00:00"
        :dateTime_time => /\A\d\d:\d\d\z/,                                                # "00:00"
      }.freeze

  end
end
