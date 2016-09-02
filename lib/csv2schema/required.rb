module Csv2schema
  module Required

    def apply_required
      @column_headers.each_with_index { |(k,v),i| @column_headers[k]['required'] = required[i] }
    end

    private

      def required
        @required ||= begin
          data = @validator.data
          data.transpose.each_with_index.map do |col|
            col.select { |c| c.blank? }.count == 0
          end
        end
      end

  end
end
