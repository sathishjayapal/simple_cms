class Subject < ActiveRecord::Base
	has_many :pages
	scope :visible, lambda {where(:visible => true)}
	scope :invisible, lambda {where(:visible => false)}
	scope :sorted, lambda {order("subjects.posi	tion ASC")}
	scope :newest_first, lambda {order("subjects.created_at desc")}
	scope :search, lambda{|query| where (["name Like ?","%#{query}%"])}
end
