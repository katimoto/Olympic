class RemoveNameFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :name, :string
  end
end
