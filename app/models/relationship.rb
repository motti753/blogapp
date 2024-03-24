# == Schema Information
#
# Table name: relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follower_id :bigint           not null
#  follwing_id :bigint           not null
#
# Indexes
#
#  index_relationships_on_follower_id  (follower_id)
#  index_relationships_on_follwing_id  (follwing_id)
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#  fk_rails_...  (follwing_id => users.id)
#
class Relationship < ApplicationRecord
end
