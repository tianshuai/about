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

  #同时删除mongodb中存储的图片
  before_destroy :delete_for_file


  ##过滤
  #排序
  scope :recent,			-> { order(created_at: :desc) }
  scope :normal,			-> { where(state: STATE[:ok]) }


  ##方法 
  #栏目位下拉选择列表
  def self.select_options(kind = 1)
	self.normal.recent.collect{ |x| [x.name, x.id] }
  end

  #图片路径
  def url(size = 'o')
	File.join(self.file_path, size, self.file_name)
  end

  ##私有方法
  private

  # 删除时同时删除源文件
  def delete_for_file
	['o','b','m','s'].each do |i|
	  path = File.join( Rails.root, CONF['asset_path'], self.url(i) )
	  File.delete( path ) if File.exist?( path )
	end

  end

end
