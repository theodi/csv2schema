require 'spec_helper'

describe Csv2schema::Formats do

  before(:each) do
    file = File.open(File.join('spec', 'fixtures', 'kitchen-sink.csv'))
    @csv = Csv2schema::CSV.new(file)
  end

  it 'applies the correct formats' do
    @csv.apply_formats

    headers = @csv.instance_variable_get("@column_headers")

    expect(headers['string']['format']).to eq(:string)
    expect(headers['integer']['format']).to eq(:numeric)
    expect(headers['float']['format']).to eq(:float)
    expect(headers['URL']['format']).to eq(:uri)
    expect(headers['boolean']['format']).to eq(:boolean)
    expect(headers['date']['format']).to eq(:date_db)
    expect(headers['datetime']['format']).to eq(:dateTime_iso8601)
    expect(headers['yearmonth']['format']).to eq(:date_month)
    expect(headers['time']['format']).to eq(:dateTime_hms)
  end


end
