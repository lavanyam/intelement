require_relative '../../test_helper'

describe IntelementVersion do
  it "must have a defined version" do
    IntelementVersion::VERSION.wont_be_nil
  end
end
