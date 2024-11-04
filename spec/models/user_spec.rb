RSpec.describe User, type: :model do
  context "Adding a comment and a change" do
    let(:user) { create(:user) }
    let(:another) { create(:user) }

    let!(:comment) do
      on("2021/01/01 11:11") { user.comments.create!(text: "Hello") }
    end
    let!(:another_comment) { another.comments.create!(text: "Another") }

    let!(:project) { create(:project, name: "old", status: "open") }
    before do
      on("2021/01/01 11:11") do
        project.update!(name: "new", status: "closed", updated_by: user)
      end
    end
    before do
      project.update!(name: "latest", status: "open", updated_by: another)
    end

    it "creates two notification for user" do
      expect(user.notifications.count).to eq 2

      expect(user.notifications).to include(user.comment_notifications.first)
      expect(user.notifications).to include(user.change_notifications.first)
    end

    it "creates two notification for another user" do
      expect(another.notifications.count).to eq 2

      expect(another.notifications).to include(
        another.comment_notifications.first,
      )
      expect(another.notifications).to include(
        another.change_notifications.first,
      )
    end

    context "changing the user's email" do
      it 'busts the notifications cache' do
        on("2022/02/02 12:22") do
          user.update!(email_address: 'new.address@example.com')
        end

        expect(user.notifications.first.updated_at.to_s).to eq(
          "2022-02-02 12:22:00 +0000",
        )
        expect(user.notifications.last.updated_at.to_s).to eq(
          "2022-02-02 12:22:00 +0000",
        )
      end
    end
  end
end
