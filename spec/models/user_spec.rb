RSpec.describe User, type: :model do
  context "Adding a comment and a change" do
    let(:user) { create(:user) }

    let!(:comment) { user.comments.create!(text: "Hello") }

    let!(:project) { create(:project, name: "old", status: "open") }
    before { project.update(name: "new", status: "closed", updated_by: user) }

    it "creates two notification" do
      expect(user.notifications.count).to eq 2
    end

    context "changing the user's email" do
      it 'busts the notifications cache' do
        expect(user.notifications.first).to receive(:touch)
        expect(user.notifications.last).to receive(:touch)

        user.update(email_address: 'new.address@example.com')
      end
    end
  end
end
