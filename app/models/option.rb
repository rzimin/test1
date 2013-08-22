class Option < ActiveRecord::Base
	belongs_to 	:question
	validates	:text, presence: true
	validates	:question_id,	presence: true
end
