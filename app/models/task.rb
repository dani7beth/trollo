class Task < ApplicationRecord
  belongs_to :list
  
  def self.all_tasks(list_id)
    Task.find_by_sql("SELECT * FROM tasks AS t
                       WHERE t.list_id = #{list_id}")
  end

  def next
    self.class.where("id > ?", id).first
  end
  def previous
    self.class.where("id < ?", id).last
  end
end
