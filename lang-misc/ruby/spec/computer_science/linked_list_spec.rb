require 'spec_helper'

RSpec.describe LinkedList,focus: true do
  context "#empty?" do
    it "initially is empty" do
      expect(subject).to be_empty
    end
  end
  context "#push" do
    it "is not empty after pushing" do
      expect{
        subject.push("foo")
      }.to change(subject,:empty?).from(true).to(false)
    end
  end

end
