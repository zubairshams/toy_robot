require 'spec_helper'
require 'table'

RSpec.describe Table do
  let(:table) { Table.new }

  describe '#valid_position' do
    context 'valid' do
      specify { expect(table.valid_position?(Position.new(3, 3))).to be_truthy }
    end

    context 'invalid' do
      specify { expect(table.valid_position?(Position.new(3, 6))).to be_falsey }
    end
  end
end
