module NotesHelper
  def getTypeName (type)
    map = {"note" => "个人笔记", "discussion" => "课堂讨论", "attachment" => "课件资源", "guide" => "课堂教案" }
    map[type]
  end
end