require "spec_helper"

describe UserMailer do
  describe "user_confirm" do
    let(:mail) { UserMailer.user_confirm }

    it "renders the headers" do
      mail.subject.should eq("User confirm")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
