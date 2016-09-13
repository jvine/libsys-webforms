require 'rails_helper'

RSpec.describe CirculationStatisticsReportFormat, type: :model do
  describe 'CirculationStatisticsReportFormat' do
    it 'has a valid factory' do
      expect(FactoryGirl.create(:circulation_statistics_report_format)).to be_valid
    end

    it 'returns a list of formats' do
      FactoryGirl.create(:circulation_statistics_report_format)
      expect(CirculationStatisticsReportFormat.formats).to eq(%w(ALL EQUIP))
    end
  end
end