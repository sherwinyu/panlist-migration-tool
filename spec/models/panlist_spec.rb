require 'spec_helper'

describe Panlist do
  describe "should have the proper attributes" do
    it { should respond_to :name }
    it { should respond_to :list_name }
    it { should respond_to :id }
    it { should respond_to :active? }
    it { should respond_to :public? }
    it { should respond_to :owners }
  end
  describe "owners association" do
    it "should work. " do
      binding.pry
    end
  end
end
