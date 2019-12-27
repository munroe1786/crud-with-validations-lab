class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    with_options if: :song_is_released? do |release|
        release.validates :release_year, presence: true, numericality: { less_than: Date.current.year }
    end

    def song_is_released?
        self.released 
    end
end
