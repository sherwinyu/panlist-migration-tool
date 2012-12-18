require 'spec_helper'

describe Owner do
  describe "should have the proper attributes" do
    it { should respond_to :netid }
    it { should respond_to :id }
    it { should respond_to :panlists }
  end
end
