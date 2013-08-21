class QuestionPool < ActiveRecord::Base
	belongs_to	:question
	belongs_to	:pool
end
