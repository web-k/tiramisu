module TableTemplate
  class Go
    def self.create
      Table.transaction do
        new_table = Table.create name: 'Go'
        41.times { new_table.items.push Item.create(kind: 'black', position_x: 600, position_y: 60, init_position_x: 600, init_position_y: 60) }
        40.times { new_table.items.push Item.create(kind: 'white', position_x: 600, position_y: 180, init_position_x: 600, init_position_y: 180) }
        new_table
      end
    end
  end
end
