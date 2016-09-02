require 'spec_helper'

describe Csv2schema::Formats do

  before(:each) do
    file = File.open(File.join('spec', 'fixtures', 'GP_Practice-info-England.csv'))
    @csv = Csv2schema::CSV.new(file)
  end

  it 'applies the correct formats' do
    @csv.apply_formats

    headers = @csv.instance_variable_get("@column_headers")

    expect(headers['GP_PRACTICE_CODE']['format']).to eq(:string)
    expect(headers['POSTCODE']['format']).to eq(:string)
    expect(headers['CCG_CODE']['format']).to eq(:string)
    expect(headers['NHSE_AREA_TEAM_CODE']['format']).to eq(:string)
    expect(headers['NHSE_REGION_CODE']['format']).to eq(:string)
    expect(headers['GP_PRACTICE_CODE']['format']).to eq(:string)
    expect(headers['TOTAL_ALL']['format']).to eq(:numeric)
    expect(headers['TOTAL_MALE']['format']).to eq(:numeric)
    expect(headers['TOTAL_FEMALES']['format']).to eq(:numeric)
    expect(headers['ORG_NAME']['format']).to eq(:string)
  end


end
