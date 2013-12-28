module TableTemplate
  class VideoChat
    def self.create
      Table.transaction do
        new_table = Table.create name: 'VideoChat'
      end
    end
  end
end

