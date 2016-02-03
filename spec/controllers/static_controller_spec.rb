require 'spec_helper'

describe StaticController do

  describe "GET 'Pages'" do
    it "returns http success" do
      get 'Pages'
      response.should be_success
    end
  end

end
