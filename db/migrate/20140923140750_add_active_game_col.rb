class AddActiveGameCol < ActiveRecord::Migration
 def self.up
   add_column :games, :active_game, :boolean, default: true
 end

 def self.down
   remove_column :games, :active_game
 end
end
