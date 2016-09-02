require 'spec_helper'

describe Csv2schema::Schema do

  before(:each) do
    file = File.open(File.join('spec', 'fixtures', 'kitchen-sink.csv'))
    @csv = Csv2schema::CSV.new(file)
  end

  it 'generates a schema' do
    schema = JSON.parse(@csv.schema)

    expect(schema).to eq({
      'fields' => [
        {
          'name' => 'string',
          'title' => 'string',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#string'
          }
        },
        {
          'name' => 'integer',
          'title' => 'integer',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#int'
          }
        },
        {
          'name' => 'float',
          'title' => 'float',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#float'
          }
        },
        {
          'name' => 'URL',
          'title' => 'URL',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#anyURI'
          }
        },
        {
          'name' => 'boolean',
          'title' => 'boolean',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#boolean'
          }
        },
        {
          'name' => 'date',
          'title' => 'date',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#date'
          }
        },
        {
          'name' => 'datetime',
          'title' => 'datetime',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#dateTime'
          }
        },
        {
          'name' => 'yearmonth',
          'title' => 'yearmonth',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#gYearMonth'
          }
        },
        {
          'name' => 'time',
          'title' => 'time',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#time'
          }
        }
      ]
    })
  end

end
