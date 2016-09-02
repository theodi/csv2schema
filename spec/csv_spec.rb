require 'spec_helper'

describe Csv2schema::CSV do

  before(:each) do
    file = File.open(File.join('spec', 'fixtures', 'GP_Practice-info-England.csv'))
    @csv = Csv2schema::CSV.new(file)
  end

  it 'sets up a hash for each header' do
    headers = @csv.instance_variable_get("@column_headers")

    expect(headers['GP_PRACTICE_CODE']).to be_a_kind_of(Hash)
    expect(headers['POSTCODE']).to be_a_kind_of(Hash)
    expect(headers['CCG_CODE']).to be_a_kind_of(Hash)
    expect(headers['NHSE_AREA_TEAM_CODE']).to be_a_kind_of(Hash)
    expect(headers['NHSE_REGION_CODE']).to be_a_kind_of(Hash)
    expect(headers['GP_PRACTICE_CODE']).to be_a_kind_of(Hash)
    expect(headers['TOTAL_ALL']).to be_a_kind_of(Hash)
    expect(headers['TOTAL_MALE']).to be_a_kind_of(Hash)
    expect(headers['TOTAL_FEMALES']).to be_a_kind_of(Hash)
    expect(headers['ORG_NAME']).to be_a_kind_of(Hash)
  end

  it 'sets the hash values we expect' do
    headers = @csv.instance_variable_get("@column_headers")

    expect(headers['GP_PRACTICE_CODE']['required']).to be true
    expect(headers['GP_PRACTICE_CODE']['format']).to eq :string
  end

end
