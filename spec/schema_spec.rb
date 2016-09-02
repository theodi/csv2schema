require 'spec_helper'

describe Csv2schema::Schema do

  before(:each) do
    file = File.open(File.join('spec', 'fixtures', 'GP_Practice-info-England.csv'))
    @csv = Csv2schema::CSV.new(file)
  end

  it 'generates a schema' do
    schema = JSON.parse(@csv.schema)

    expect(schema).to eq({
      'fields' => [
        {
          'name' => 'GP_PRACTICE_CODE',
          'title' => 'GP_PRACTICE_CODE',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#string'
          }
        },
        {
          'name' => 'POSTCODE',
          'title' => 'POSTCODE',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#string'
          }
        },
        {
          'name' => 'CCG_CODE',
          'title' => 'CCG_CODE',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#string'
          }
        },
        {
          'name' => 'NHSE_AREA_TEAM_CODE',
          'title' => 'NHSE_AREA_TEAM_CODE',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#string'
          }
        },
        {
          'name' => 'NHSE_REGION_CODE',
          'title' => 'NHSE_REGION_CODE',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#string'
          }
        },
        {
          'name' => 'TOTAL_ALL',
          'title' => 'TOTAL_ALL',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#int'
          }
        },
        {
          'name' => 'TOTAL_MALE',
          'title' => 'TOTAL_MALE',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#int'
          }
        },
        {
          'name' => 'TOTAL_FEMALES',
          'title' => 'TOTAL_FEMALES',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#int'
          }
        },
        {
          'name' => 'ORG_NAME',
          'title' => 'ORG_NAME',
          'constraints' => {
            'required' => true,
            'type' => 'http://www.w3.org/2001/XMLSchema#string'
          }
        }
      ]
    })
  end

end
