class AlterColumUsersGender < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.change :gender, :string
    end
  end
  def self.down
    change_table :users do |t|
      t.change :gender, :integer
    end
  end

end
