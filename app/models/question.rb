class Question < ActiveRecord::Base
	has_many 	:pools, through: :question_pools
	has_many	:question_pools
	has_many	:options
	accepts_nested_attributes_for	:pools
	validates	:content,	presence: true
end
