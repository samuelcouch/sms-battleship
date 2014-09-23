class CreateGames < ActiveRecord::Migration
 def self.up
   create_table :games do |t|
     t.string :player_one
     t.string :player_two
     t.string :player_one_ship_location
     t.string :player_two_ship_location
     t.boolean :player_one_sunk
     t.boolean :player_two_sunk
     t.integer :turns_played
     t.boolean :challenge_accepted
     t.timestamps
   end
 end

 def self.down
   drop_table :games
 end
end