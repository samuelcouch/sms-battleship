class CreateGames < ActiveRecord::Migration
 def self.up
   create_table :games do |t|
     t.string :player_one
     t.string :player_two
     t.string :player_one_ship_location
     t.string :player_two_ship_location
     t.boolean :player_one_sunk, default: false
     t.boolean :player_two_sunk, default: false
     t.integer :turns_played, default: 0
     t.boolean :challenge_accepted, default: false
     t.timestamps
   end
 end

 def self.down
   drop_table :games
 end
end