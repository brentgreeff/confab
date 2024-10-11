FactoryBot.define do
  factory :change do
    auditable { create(:project) }
    author { create(:user) }
    json { { "name"=>[ "old", "new" ] } }
  end
end
