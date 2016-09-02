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
        numeric: 'http://www.w3.org/2001/XMLSchema#int',
        float: 'http://www.w3.org/2001/XMLSchema#float',
        uri: 'http://www.w3.org/2001/XMLSchema#anyURI',
        boolean: 'http://www.w3.org/2001/XMLSchema#boolean',
        date_db: 'http://www.w3.org/2001/XMLSchema#date',
        dateTime_iso8601: 'http://www.w3.org/2001/XMLSchema#dateTime',
        date_month: 'http://www.w3.org/2001/XMLSchema#gYearMonth',
        dateTime_hms: 'http://www.w3.org/2001/XMLSchema#time'
      }[format]
    end

  end
end
