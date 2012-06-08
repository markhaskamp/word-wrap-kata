require File.dirname(__FILE__) + '/../app/Wrapper.rb'

describe "Wrapper" do
  w = Wrapper.new

  describe "#wrap" do
  
    it "string less than max column, then returns string" do
      w.wrap("foo", 80).should == "foo"
    end

    it "string longer than max, then splits the string at the max length" do
      w.wrap("foobar", 3).should == "foo\nbar"
    end

    it "string must be split more than once" do
      w.wrap("onetwothree", 3).should == "one\ntwo\nthr\nee"
    end

    it "string will be split on last space instead of at max length if appropriate" do
      w.wrap("one two", 5).should == "one\ntwo"

      w.wrap("one twothreefourfive six seven", 5).should ==
              "one\ntwoth\nreefo\nurfiv\ne six\nseven"

      w.wrap("12 456 890", 6).should == "12 456\n890"
    end

  end

  describe "#get_split_index " do
      it "returns max if there is no space" do
        w.get_split_index("foo", 5).should == 5
      end

      it "returns index of last space when appropriate" do
        w.get_split_index("foo bar",5).should == 3
        w.get_split_index("foo bar baz", 8).should == 7
      end

      it "will return max if str[max] is a space" do
        w.get_split_index("12 456 789",6).should == 6 
      end

  end

end

describe "rspec start" do
  it "this too shall pass" do
    true.should == true
  end
end

