require 'spec_helper'

describe User do

  let(:valid_attributes) {
    {
      first_name: "Marc",
      last_name: "Seitz",
      twitter_name: "mfts0",
      email: "marc@hackevents.co",
      password: "treehouse1234",
      password_confirmation: "treehouse1234"
    }
  }

  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email, case-insensitive" do
      user.email = "MARC@HACKEVENTS.CO"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email to look like an email" do
      user.email = "marc"
      expect(user).to_not be_valid
    end

  end

  describe "#downcase_email" do
    it "makes the email attribute lowercase" do
      user = User.new(valid_attributes.merge(email: "MARC@HACKEVENTS.CO"))
      expect{ user.downcase_email }.to change{ user.email }.
        from("MARC@HACKEVENTS.CO").
        to("marc@hackevents.co")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "STROBL@HACKEVENTS.CO"
      expect(user.save).to be_true
      expect(user.email).to eq("strobl@hackevents.co")
    end
  end

  describe "#generate_password_reset_token!" do
    let(:user) { create(:user) }
    it "changes the password_reset_token attribute" do
      expect{ user.generate_password_reset_token! }.to change{user.password_reset_token}
    end

    it "calls SecureRandom.urlsafe_base64 to generate the password_reset_token" do
      expect(SecureRandom).to receive(:urlsafe_base64)
      user.generate_password_reset_token!
    end
  end

end
