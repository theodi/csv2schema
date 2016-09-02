module Csv2schema
  class CSV
    include Csv2schema::Formats
    include Csv2schema::Required

    def initialize(io)
      @validator = Csvlint::Validator.new(io)
      @column_headers = get_column_headers
      apply_formats
      apply_required
    end

    private

      def get_column_headers
        headers = @validator.data.first
        Hash[headers.each_with_index.map { |col, i| [col, {'name' => col}] }]
      end

  end
end
