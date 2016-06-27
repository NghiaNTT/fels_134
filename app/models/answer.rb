class Answer < ActiveRecord::Base
  belongs_to :word
  scope :eager_load_by_ids, ->(ids) do
    eager_load(word: :answers).where id: ids
  end
end
