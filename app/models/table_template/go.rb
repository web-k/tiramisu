module TableTemplate
  class Go
    def self.create
      Table.transaction do
        new_table = Table.create name: 'Go'
        20.times { new_table.items.push Item.create(kind: 'black', position_x: 600, position_y: 60) }
        20.times { new_table.items.push Item.create(kind: 'white', position_x: 600, position_y: 180) }
        new_table
      end
    end
  end
end
