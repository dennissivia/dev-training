require 'spec_helper'

RSpec.describe ComputerScience::Stack do
  context "#size" do
    it "responds to size" do
      expect(subject.size).to be_zero
    end
  end
  
  context "#push" do
    it "supports push" do
      expect{ 
        subject.push(10)
        subject.push(1)
      }.to change(subject,:size).from(0).to(2)
    end
  end

  context "#pop" do
    it "returns nil on empty stacks" do
      expect(subject.pop).to be_nil
    end

    it "returns the last inserted element" do
      subject.push(1)
      subject.push(2)

      expect(subject.pop). to eq(2)
    end

    it "reduces the size by one" do
      subject.push(1)
      expect{
        subject.pop
      }.to change(subject,:size).from(1).to(0)
    end

    it "has a minimum size of 0" do
      expect{
        subject.pop
      }.to_not change(subject,:size)
    end
  end

  context "#empty?" do
    it "is empty after creation" do
      expect(subject.empty?).to be_truthy
    end
    it "is not empty after push" do
      subject.push(1)
      expect(subject.empty?).to be_falsey
    end
    it "stays empty on pop on empty stack" do
      subject.pop

      expect(subject.empty?).to be_truthy
    end
  end


end
