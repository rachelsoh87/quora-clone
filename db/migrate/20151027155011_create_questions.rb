class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string      :question_content, null: false
      t.references  :user, index: true, null: false
      
      t.timestamps null:false
    end  
  end
end