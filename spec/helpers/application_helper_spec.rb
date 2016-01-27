require 'rails_helper'

describe ApplicationHelper do
  describe '#dialog_column_class' do
    it 'should return a string representing the main dialog class' do
      expect(dialog_column_class).to eq 'col-md-6 col-md-offset-3'
    end
  end

  describe '#label_column_class' do
    it 'should return a string representing the label class' do
      expect(label_column_class).to eq 'col-sm-3'
    end
  end

  describe '#label_column_offset_class' do
    it 'should be defined to help when offseting non-labeled form elements (e.g. buttons)' do
      expect(label_column_offset_class).to eq 'col-sm-offset-3'
    end
  end

  describe '#content_column_class' do
    it 'should define a custom column class' do
      expect(content_column_class).to eq 'col-sm-9'
    end
  end
end
