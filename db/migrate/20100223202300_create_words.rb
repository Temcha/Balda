class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.column "value", :string
      t.timestamps
    end

    Word.create :value => 'controller'
    Word.create :value => 'view'
    Word.create :value => 'model'
    Word.create :value => 'route'
    Word.create :value => 'migtration'
    Word.create :value => 'ruby'
    Word.create :value => 'rails'
  end

  def self.down
    drop_table :words
  end
end
