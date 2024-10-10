RSpec.describe Comment, type: :model do
  context "Adding a comment" do
    let!(:comment) { create(:comment, text: "Hello") }

    it "creates a notification" do
      expect(Notification.first.reload.message).to eq(
        "Hello",
      )
    end
  end
end
