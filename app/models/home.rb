class Home
  include ActiveModel::Model
  attr_accessor :content
  validates :content, presence: true

  def make_arr
    if self.content
      self.content.split(" ")
    else
      #エラー処理へ繊維
    end
  end

  def trim
    @trimmer = self.make_arr
    @trimmer.map do |str|
      if str == "select"
        str.upcase!
      else
        str
      end
    end 
  end
end
