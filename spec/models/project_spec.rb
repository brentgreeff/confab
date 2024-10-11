RSpec.describe Project, type: :model do
  let(:author) { create(:user) }
  let!(:project) do
    on("2021/01/01 11:11") { create(:project, name: "old", status: "open") }
  end

  context "Changing the status and name" do
    before do
      on("2022/02/02 02:02") do
        project.updated_by = author
        project.update(name: "new", status: "closed")
      end
    end

    it "records a change" do
      expect(project.recorded_changes.reload.count).to eq 1
      expect(project.recorded_changes.last.json).to eq(
        { "name"=>[ "old", "new" ], "status"=>[ "open", "closed" ] },
      )
    end

    it "records who made the change" do
      expect(project.recorded_changes.last.author).to eq(author)
    end

    it "creates a notification" do
      name = 'Name changed from "old" to "new"'
      status = 'Status changed from "open" to "closed"'
      expect(project.recorded_changes.last.notification.reload.message).to eq(
        "#{name}, #{status}",
      )
    end

    context "another change" do
      before do
        on("2023/03/03 03:03") do
          project.updated_by = author
          project.update(name: "Another", status: "Finished")
        end
      end

      it "is also recorded" do
        expect(project.recorded_changes.reload.count).to eq 2
        expect(project.recorded_changes.last.json).to eq(
          { "name"=>[ "new", "Another" ], "status"=>[ "closed", "Finished" ] },
        )
      end
    end
  end
end
