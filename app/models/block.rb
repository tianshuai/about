class Block < ActiveRecord::Base

  #关联
  belongs_to :relateable,   polymorphic: true
  belongs_to :user

  ##常量
  #类型
  KIND = {
    aaa: 1,
    bbb: 2
  }

  #状态
  STATE = {
  	no: 0,
	ok: 1
  }

  ##过滤
  #排序
  scope :recent,			-> { order(created_at: :desc) }


  ## 方法

end
