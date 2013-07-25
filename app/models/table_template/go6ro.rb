module TableTemplate
  class Go6ro
    def self.create
      Table.transaction do
        new_table = Table.create name: 'Go6ro'
        18.times { new_table.items.push Item.create(kind: 'black', position_x: 560, position_y: 420, init_position_x: 560, init_position_y:420) }
        18.times { new_table.items.push Item.create(kind: 'white', position_x: 90, position_y: 120, init_position_x: 90, init_position_y:120) }
        new_table
      end
    end
  end
end
