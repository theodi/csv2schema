module Csv2schema
  module Formats

    def apply_formats
      @column_headers.each_with_index { |(k,v),i| @column_headers[k]['format'] = formats[i] }
    end

    private

      def formats
        @formats ||= begin
          formats = @validator.instance_variable_get("@formats")

          formats.map do |formats|
            get_format(formats)
          end
        end
      end

      def get_format(candidates)
        total = candidates.values.reduce(:+)
        best = :string
        candidates.each do |k,v|
          best = k if v > (total * 0.8)
        end
        best
      end

  end
end
