class Question < ActiveRecord::Base
	has_many 	:pools, through: :question_pools
	has_many	:question_pools
	accepts_nested_attributes_for	:pools
end
