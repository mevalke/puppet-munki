require 'spec_helper'
describe 'munki' do
  context 'with default values for all parameters' do
    it { should contain_class('munki') }
  end
end
