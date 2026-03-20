class AddAcademicYearToClubMembers < ActiveRecord::Migration[8.1]
  def change
    add_reference :club_members, :academic_year, foreign_key: true
  end
end
