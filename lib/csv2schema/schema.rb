module Csv2schema
  module Schema

    def schema
      fields = @column_headers.map do |key,col|
        {
          name: col['name'],
          title: col['name'],
          constraints: {
            required: col['required'],
            type: get_type(col['format'])
          }
        }
      end

      {
        "fields": fields
      }.to_json
    end

    def get_type(format)
      {
        string: 'http://www.w3.org/2001/XMLSchema#string',
        numeric: 'http://www.w3.org/2001/XMLSchema#int'
      }[format]
    end

  end
end
