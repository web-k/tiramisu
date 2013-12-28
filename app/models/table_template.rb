module TableTemplate
  def self.find table_name
    case table_name
    when 'Go' then TableTemplate::Go
    when 'Go6ro' then TableTemplate::Go6ro
    when 'VideoChat' then TableTemplate::VideoChat
    else nil end
  end
end
