class Asset < ActiveRecord::Base

  ##关系

  ##验证
  validates_presence_of :name,                    message: '不能为空'

  ##常量
  #类型
  KIND = {
	#图片
  	img: 1,
	#文字
	text: 2
  }

  #状态
  STATE = {
  	no: 0,
	ok: 1
  }


  ##过滤
  #排序
  scope :recent,			-> { order(created_at: :desc) }
  scope :normal,			-> { where(state: STATE[:ok]) }


  ##方法 
  #栏目位下拉选择列表
  def self.select_options(kind = 1)
	self.normal.recent.collect{ |x| [x.name, x.id] }
  end

end
