require 'spec_helper'

describe Csv2schema::Required do

  context 'with all required fields' do

    it 'applies the correct required states' do
      file = File.open(File.join('spec', 'fixtures', 'GP_Practice-info-England.csv'))
      @csv = Csv2schema::CSV.new(file)
      @csv.apply_required

      headers = @csv.instance_variable_get("@column_headers")

      expect(headers['GP_PRACTICE_CODE']['required']).to be true
      expect(headers['POSTCODE']['required']).to be true
      expect(headers['CCG_CODE']['required']).to be true
      expect(headers['NHSE_AREA_TEAM_CODE']['required']).to be true
      expect(headers['NHSE_REGION_CODE']['required']).to be true
      expect(headers['GP_PRACTICE_CODE']['required']).to be true
      expect(headers['TOTAL_ALL']['required']).to be true
      expect(headers['TOTAL_MALE']['required']).to be true
      expect(headers['TOTAL_FEMALES']['required']).to be true
      expect(headers['ORG_NAME']['required']).to be true
    end

  end

  context 'with fields with some blank values' do

    it 'applies the correct required states' do
      file = File.open(File.join('spec', 'fixtures', 'optional-fields.csv'))
      @csv = Csv2schema::CSV.new(file)

      @csv.apply_required
      headers = @csv.instance_variable_get("@column_headers")

      expect(headers['Foo']['required']).to be false
      expect(headers['Bar']['required']).to be true
      expect(headers['Baz']['required']).to be true
    end

  end

end
