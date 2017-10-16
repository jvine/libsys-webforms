require 'rails_helper'
require 'circ_stats_report_examples'
RSpec.describe CirculationStatisticsReportsController, type: :controller do
  before(:each) do
    stub_current_user(FactoryGirl.create(:authorized_user))
  end

  let(:params) { { email: 'test@test.org', lib_array: 'GREEN' } }

  describe 'get#new' do
    it 'renders the correct template' do
      get 'new'
      expect(response).to render_template('new')
    end
  end
  describe 'get#home_locations' do
    it 'returns a 200 response code' do
      xhr :get, :home_locations
      expect(response.status).to eq(200)
    end
  end
  describe 'post#create' do
    it 'redirects to root_url on success' do
      post :create, circulation_statistics_report: { email: 'test@test.org', lib_array: 'GREEN',
                                                     call_lo: 'L', format_array: ['', 'MARC'] }
      expect(response).to redirect_to root_url
    end
    it 'renders new template on failure' do
      post :create, circulation_statistics_report: { email: '', lib_array: '', call_lo: '' }
      expect(response).to render_template('new')
    end
  end

  include_examples 'circ_stats_report_examples'
end
