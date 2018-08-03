require 'rails_helper'

RSpec.describe EdiInvoicesController, type: :controller do
  before(:each) do
    @edi_invoice = FactoryBot.create(:edi_invoice)
  end
  describe 'get#index' do
    it 'be successful returning the index page' do
      stub_current_user(FactoryBot.create(:authorized_user))
      get :index
      expect(response).to be_successful
      expect(assigns(:edi_invoice)).to be_kind_of(ActiveRecord::Relation)
    end
  end
  describe 'get#invoice_exclude' do
    it 'renders new modal to exclude an invoice' do
      xhr :get, 'invoice_exclude', format: 'js'
      expect(response).to have_http_status(302)
    end
  end
  describe 'get#change_invoice_line' do
    it 'renders new modal to change an invoice line' do
      xhr :get, 'change_invoice_line', format: 'js'
      expect(response).to have_http_status(302)
    end
  end
  let(:message) { get :update, vendors: 'AMALIV', invoice_number: '22222' }
  describe 'update with actual table updates' do
    before do
      stub_current_user(FactoryBot.create(:authorized_user))
    end
    it 'notifies of possible changes to the table' do
      controller.instance_variable_set(:@message, message)
      expect(flash).to be_present
      expect(response).to redirect_to edi_invoices_menu_path
    end
  end
end