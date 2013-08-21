class Pool < ActiveRecord::Base
	has_many	:question_pools
	has_many	:questions, through: :question_pools
end
