module TableTemplate
  class VideoChat
    def self.create
      Table.transaction do
        Table.create name: 'VideoChat'
      end
    end
  end
end
