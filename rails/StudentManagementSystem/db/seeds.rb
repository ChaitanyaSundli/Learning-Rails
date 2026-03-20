require 'faker'

puts "Cleaning database..."

[
  ExamResult, Exam, Attendance, Timetable, TeacherAssignment,
  ClassSubject, Enrollment, Student, Teacher,
  Subject, SchoolClass, Department, Location,
  AcademicYear, TimeSlot, Club, ClubMember, ClubSchedule
].each(&:delete_all)

puts "Creating Academic Year..."

current_year = AcademicYear.create!(
  name: "2025-26",
  start_date: "2025-06-01",
  end_date: "2026-03-31",
  active: true
)

puts "Creating TimeSlots..."
start_hour = 8

time_slots = 6.times.map do |i|
  start_time = Time.parse("#{start_hour + i}:00")
  end_time = Time.parse("#{start_hour + i + 1}:00")

  TimeSlot.create!(
    name: "Period #{i + 1}",
    start_time: start_time,
    end_time: end_time,
    position: i + 1
  )
end

puts "Creating Locations..."

locations = 10.times.map do
  Location.create!(
    name: "Room #{('A'..'Z').to_a.sample}-#{rand(100..999)}",
    building: ["A", "B", "C"].sample,
    floor: rand(1..3),
    location_type: ["classroom", "lab", "club"].sample
  )
end

puts "Creating Departments..."

departments = [
  "Science",
  "Mathematics",
  "English",
  "History",
  "Computer",
  "Sports"
].map do |name|
  Department.find_or_create_by!(name: name)
end

puts "Creating Teachers..."

teachers = 20.times.map do
  Teacher.create!(
    name: Faker::Name.name,
    dob: Faker::Date.birthday(min_age: 25, max_age: 60),
    phone: Faker::Number.unique.number(digits: 10).to_s,
    email: Faker::Internet.unique.email,
    department: departments.sample,
    password: "password",
    is_hod: false
  )
end

# Assign HOD
departments.each do |dept|
  teacher = teachers.select { |t| t.department == dept }.sample
  teacher.update!(is_hod: true) if teacher
end

puts "Creating Subjects..."

subjects = 10.times.map do
  Subject.create!(
    name: Faker::Educator.unique.subject,
    description: Faker::Lorem.sentence
  )
end

puts "Creating School Classes..."

classes = 10.times.map do
  SchoolClass.create!(
    grade_lvl: rand(1..10),
    section: ["A", "B", "C"].sample,
    location: locations.sample,
    academic_year: current_year
  )
end

puts "Creating ClassSubjects..."

class_subjects = classes.flat_map do |cls|
  subjects.sample(5).map do |sub|
    ClassSubject.create!(
      school_class: cls,
      subject: sub,
      academic_year: current_year,
      credit: rand(1..5),
      syllabus: Faker::Lorem.sentence
    )
  end
end

puts "Assigning Teachers..."

teacher_assignments = class_subjects.map do |cs|
  TeacherAssignment.create!(
    teacher: teachers.sample,
    class_subject: cs,
    academic_year: current_year
  )
end

puts "Creating Students..."

students = 50.times.map do
  Student.create!(
    name: Faker::Name.name,
    dob: Faker::Date.birthday(min_age: 6, max_age: 18),
    phone: Faker::Number.unique.number(digits: 10).to_s,
    address: Faker::Address.full_address,
    password: "password"
  )
end

puts "Creating Enrollments..."

enrollments = students.map do |student|
  Enrollment.create!(
    student: student,
    school_class: classes.sample,
    academic_year: current_year,
    status: "active"
  )
end

puts "Creating Timetable..."

days = Timetable::DAYS

class_subjects.each do |cs|
  days.sample(3).each do |day|
    time_slots.sample(2).each do |slot|

      teacher_id = TeacherAssignment
        .find_by(class_subject_id: cs.id, academic_year_id: academic_year.id)
        &.teacher_id

      next unless teacher_id

      conflict = Timetable
        .joins(:class_subject)
        .joins("INNER JOIN teacher_assignments ON teacher_assignments.class_subject_id = class_subjects.id")
        .where(teacher_assignments: { teacher_id: teacher_id, academic_year_id: academic_year.id })
        .where(day_of_week: day, time_slot_id: slot.id)
        .exists?

      next if conflict

      Timetable.create!(
        class_subject_id: cs.id,
        academic_year_id: academic_year.id,
        day_of_week: day,
        time_slot_id: slot.id
      )

    end
  end
end

puts "Creating Attendance..."

students.each do |student|
  used_slots = []

  5.times do
    slot = time_slots.sample

    next if used_slots.include?(slot.id)

    used_slots << slot.id

    Attendance.create!(
      student: student,
      date: Date.today,
      time_slot: slot,
      academic_year: academic_year,
      status: ["present", "absent"].sample
    )
  end
end
puts "Creating Exams..."

exams = class_subjects.sample(10).map do |cs|
  Exam.create!(
    class_subject: cs,
    academic_year: current_year,
    time_slot: time_slots.sample,
    exam_type: ["unit", "midterm", "final"].sample,
    exam_date: Faker::Date.forward(days: 30),
    max_mark: 100,
    pass_mark: 35
  )
end

puts "Creating Exam Results..."

exams.each do |exam|
  students.sample(10).each do |student|
    ExamResult.create!(
      student: student,
      exam: exam,
      marks_obtained: rand(30..100),
      academic_year: current_year
    )
  end
end

puts "Creating Clubs..."

clubs = 5.times.map do
  Club.create!(
    name: Faker::Team.name,
    teacher: teachers.sample,
    category: ["sports", "arts", "science"].sample
  )
end

puts "Creating Club Members..."

clubs.each do |club|
  students.sample(10).each do |student|
    ClubMember.create!(
      student: student,
      club: club,
      role: ["member", "leader"].sample,
      status: "active"
    )
  end
end

puts "Creating Club Schedules..."

clubs.each do |club|
  3.times do
    ClubSchedule.create!(
      club: club,
      activity_type: Faker::Lorem.word,
      schedule_date: Faker::Date.forward(days: 10),
      start_time: "16:00",
      end_time: "17:00",
      location: locations.sample
    )
  end
end

puts "Seeding completed successfully! 🎉"