RSpec.describe Change, type: :model do
  context "Changing something" do
    let(:change) do
      create(:change, json: { "name"=>[ "old", "new" ] })
    end

    it "creates a notification" do
      expect(change.notification.reload.message).to eq(
        'Name changed from "old" to "new"',
      )
    end

    it "broadcasts the notification" do
      expect {
        change
      }.to have_broadcasted_to('notification_stream').exactly(:once).with { |r|
        expect(r).to match %r{prepend}
      }
    end
  end
end
