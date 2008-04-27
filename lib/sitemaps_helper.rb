module SitemapsHelper 
  
  def w3c_date(date)
     date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
  end
  
  def copyright_date
    Time.now.year
  end
end