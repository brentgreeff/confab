RSpec.describe Comment, type: :model do
  context "Adding a comment" do
    let(:user) { create(:user) }
    let!(:comment) { user.comments.create!(text: "Hello") }

    it "creates a notification" do
      expect(Notification.first.reload.message).to eq(
        "Hello",
      )
    end
  end
end
