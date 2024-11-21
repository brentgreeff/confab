module UserStats
  extend self

  def changes
    User.
      left_joins(:recorded_changes).
      select(<<-SQL.squish).
        users.email_address,
        COUNT(changes.id) AS changes_count
      SQL
      group("users.id").
      order("changes_count")
  end
end
