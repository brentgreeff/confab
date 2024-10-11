RSpec.describe Comment, type: :model do
  context "Adding a comment" do
    let(:user) { create(:user) }
    let(:comment) { user.comments.create!(text: "Hello") }

    it "creates a notification" do
      expect(comment.notification.reload.message).to eq(
        "Hello",
      )
    end

    it "broadcasts the notification" do
      expect {
        comment
      }.to have_broadcasted_to('notification_stream').exactly(:once).with { |r|
        expect(r).to match %r{prepend}
      }
    end
  end
end
