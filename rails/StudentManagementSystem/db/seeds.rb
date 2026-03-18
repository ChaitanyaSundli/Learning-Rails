
def unique_phone(klass, prefix)
  loop do
    phone = "#{prefix}#{rand(100000000..999999999)}"
    return phone unless klass.exists?(phone: phone)
  end
end

location_names = [
  "Room No 101", "Room No 102", "Room No 103",
  "Room No 104", "Room No 105",
  "Science Lab", "Computer Lab",
  "Art Room", "Tabla Room", "Playground"
]

locations = location_names.map do |name|
  Location.find_or_create_by!(name: name)
end

class_rooms = locations.select { |l| l.name.include?("Room No") }

departments = %w[Science Mathematics Arts Sports].map do |name|
  Department.find_or_create_by!(name: name)
end

teachers = 10.times.map do |i|
  teacher = Teacher.find_or_initialize_by(email: "teacher#{i+1}@school.com")

  teacher.update!(
    name: "Teacher #{i+1}",
    dob: Date.new(1980+i, rand(1..12), rand(1..28)),
    phone: unique_phone(Teacher, "9"),
    department: departments[i % departments.size],
    is_hod: false
  )

  teacher
end

departments.each do |dept|
  next if dept.teachers.where(is_hod: true).exists?
  dept.teachers.first&.update(is_hod: true)
end

subjects = %w[Math Science English History Geography Art Sports].map do |name|
  Subject.find_or_create_by!(name: name)
end

classes = (6..10).flat_map do |grade|
  %w[A B].map do |sec|
    SchoolClass.find_or_create_by!(grade_lvl: grade, section: sec) do |cls|
      cls.location = class_rooms.sample
    end
  end
end

classes.each do |cls|
  subjects.sample(4).each do |sub|
    ClassSubject.find_or_create_by!(school_class: cls, subject: sub) do |cs|
      cs.credit = 4
    end
  end
end

students = Student.all.to_a
(100 - students.size).times do
  students << Student.create!(
    name: "Student #{students.size + 1}",
    dob: Date.new(2008, rand(1..12), rand(1..28)),
    phone: unique_phone(Student, "8"),
    address: "City",
    school_class: classes.sample
  )
end

days = %w[Monday Tuesday Wednesday Thursday Friday]
slots = [
  ["09:00","10:00"], ["10:00","11:00"], ["11:00","12:00"],
  ["12:00","13:00"], ["14:00","15:00"], ["15:00","16:00"]
]

classes.each do |cls|
  days.each do |day|
    slots.each do |start_t, end_t|
      next if Timetable.joins(:class_subject).exists?(
        class_subjects: { school_class_id: cls.id },
        day: day,
        start_time: start_t
      )

      attempts = 0
      created = false

      while attempts < 20 && !created
        teacher = teachers.sample
        class_subject = cls.class_subjects.sample

        timetable = Timetable.new(
          class_subject: class_subject,
          teacher: teacher,
          day: day,
          start_time: start_t,
          end_time: end_t
        )

        if timetable.valid?
          timetable.save!
          created = true
        else
          attempts += 1
        end
      end
    end
  end
end

students.each do |student|
  3.times do
    date = Date.today - rand(1..7)
    next if Attendance.exists?(student: student, date: date)

    Attendance.create!(
      student: student,
      date: date,
      status: %w[Present Absent].sample
    )
  end
end

exams = subjects.map do |sub|
  Exam.find_or_create_by!(subject: sub, exam_type: "Midterm") do |e|
    e.exam_date = Date.today + rand(10..20)
    e.start_time = "10:00"
    e.end_time = "12:00"
    e.max_mark = 100
    e.pass_mark = 35
  end
end

students.each do |student|
  exams.sample(3).each do |exam|
    next if ExamResult.exists?(student: student, exam: exam)

    marks = rand(30..100)

    ExamResult.create!(
      student: student,
      exam: exam,
      marks_obtained: marks,
      grade: marks > 75 ? "A" : marks > 50 ? "B" : "C"
    )
  end
end

clubs = [
  { name: "Art Club", teacher: teachers[0] },
  { name: "Music Club", teacher: teachers[1] },
  { name: "Science Club", teacher: teachers[2] }
].map do |c|
  Club.find_or_create_by!(name: c[:name]) do |club|
    club.teacher = c[:teacher]
    club.category = "General"
  end
end

students.sample(60).each do |student|
  next if student.club_member.present?

  ClubMember.create!(
    student: student,
    club: clubs.sample,
    role: "Member",
    status: "Active"
  )
end

clubs.each do |club|
  2.times do
    attempts = 0
    created = false

    while attempts < 25 && !created
      date = Date.today + rand(1..5)
      location = locations.sample

      start_t = ["14:00","15:00","16:00"].sample
      end_t = (Time.parse(start_t) + 2.hours).strftime("%H:%M")

      schedule = ClubSchedule.new(
        club: club,
        activity_type: "Practice",
        schedule_date: date,
        start_time: start_t,
        end_time: end_t,
        location: location
      )

      if schedule.valid?
        schedule.save!
        created = true
      else
        attempts += 1
      end
    end

  end
end
