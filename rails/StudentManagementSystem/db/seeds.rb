puts "Cleaning database..."

[
  ClubMember,
  ClubSchedule,
  Attendance,
  Timetable,
  ExamResult,
  Exam,
  TeacherAssignment,
  ClassSubject,
  Enrollment,
  Club,
  Student,
  Teacher,
  Subject,
  SchoolClass,
  Department,
  Location,
  TimeSlot,
  AcademicYear
].each(&:delete_all)

# =============================
# Academic Year
# =============================
year = AcademicYear.create!(
  name: "2025-2026",
  start_date: Date.new(2025,6,1),
  end_date: Date.new(2026,5,31),
  active: true
)

# =============================
# TimeSlots (10)
# =============================
ts1 = TimeSlot.create!(name:"P1", start_time:"08:00", end_time:"09:00", position:1)
ts2 = TimeSlot.create!(name:"P2", start_time:"09:00", end_time:"10:00", position:2)
ts3 = TimeSlot.create!(name:"P3", start_time:"10:00", end_time:"11:00", position:3)
ts4 = TimeSlot.create!(name:"P4", start_time:"11:00", end_time:"12:00", position:4)
ts5 = TimeSlot.create!(name:"P5", start_time:"12:00", end_time:"13:00", position:5)
ts6 = TimeSlot.create!(name:"P6", start_time:"13:00", end_time:"14:00", position:6)
ts7 = TimeSlot.create!(name:"P7", start_time:"14:00", end_time:"15:00", position:7)
ts8 = TimeSlot.create!(name:"P8", start_time:"15:00", end_time:"16:00", position:8)
ts9 = TimeSlot.create!(name:"P9", start_time:"16:00", end_time:"17:00", position:9)
ts10 = TimeSlot.create!(name:"P10", start_time:"17:00", end_time:"18:00", position:10)

# =============================
# Locations (10)
# =============================
l1 = Location.create!(name:"Room A1", building:"A", floor:"1", location_type:"classroom")
l2 = Location.create!(name:"Room A2", building:"A", floor:"1", location_type:"classroom")
l3 = Location.create!(name:"Room B1", building:"B", floor:"1", location_type:"classroom")
l4 = Location.create!(name:"Room B2", building:"B", floor:"1", location_type:"classroom")
l5 = Location.create!(name:"Lab 1", building:"C", floor:"1", location_type:"lab")
l6 = Location.create!(name:"Lab 2", building:"C", floor:"1", location_type:"lab")
l7 = Location.create!(name:"Room C1", building:"C", floor:"2", location_type:"classroom")
l8 = Location.create!(name:"Room C2", building:"C", floor:"2", location_type:"classroom")
l9 = Location.create!(name:"Room D1", building:"D", floor:"1", location_type:"classroom")
l10 = Location.create!(name:"Club Room", building:"E", floor:"1", location_type:"club")

# =============================
# Departments
# =============================
d1 = Department.create!(name:"Science")
d2 = Department.create!(name:"Math")
d3 = Department.create!(name:"English")

# =============================
# Teachers (10)
# =============================
t1 = Teacher.create!(name:"T1", email:"t1@mail.com", phone:"1000000000", department:d1, password:"123456")
t2 = Teacher.create!(name:"T2", email:"t2@mail.com", phone:"2000000000", department:d2, password:"123456")
t3 = Teacher.create!(name:"T3", email:"t3@mail.com", phone:"3000000000", department:d3, password:"123456")
t4 = Teacher.create!(name:"T4", email:"t4@mail.com", phone:"4000000000", department:d1, password:"123456")
t5 = Teacher.create!(name:"T5", email:"t5@mail.com", phone:"5000000000", department:d2, password:"123456")
t6 = Teacher.create!(name:"T6", email:"t6@mail.com", phone:"6000000000", department:d3, password:"123456")
t7 = Teacher.create!(name:"T7", email:"t7@mail.com", phone:"7000000000", department:d1, password:"123456")
t8 = Teacher.create!(name:"T8", email:"t8@mail.com", phone:"8000000000", department:d2, password:"123456")
t9 = Teacher.create!(name:"T9", email:"t9@mail.com", phone:"9000000000", department:d3, password:"123456")
t10 = Teacher.create!(name:"T10", email:"t10@mail.com", phone:"1000000000", department:d1, password:"123456")

# =============================
# Subjects (10)
# =============================
s1 = Subject.create!(name:"Math")
s2 = Subject.create!(name:"Science")
s3 = Subject.create!(name:"English")
s4 = Subject.create!(name:"History")
s5 = Subject.create!(name:"Geography")
s6 = Subject.create!(name:"Physics")
s7 = Subject.create!(name:"Chemistry")
s8 = Subject.create!(name:"Biology")
s9 = Subject.create!(name:"Computer")
s10 = Subject.create!(name:"Sports")

# =============================
# Classes (10)
# =============================
c1 = SchoolClass.create!(grade_lvl:1, section:"A", location:l1, academic_year_id:year.id)
c2 = SchoolClass.create!(grade_lvl:1, section:"B", location:l2, academic_year_id:year.id)
c3 = SchoolClass.create!(grade_lvl:2, section:"A", location:l3, academic_year_id:year.id)
c4 = SchoolClass.create!(grade_lvl:2, section:"B", location:l4, academic_year_id:year.id)
c5 = SchoolClass.create!(grade_lvl:3, section:"A", location:l5, academic_year_id:year.id)
c6 = SchoolClass.create!(grade_lvl:3, section:"B", location:l6, academic_year_id:year.id)
c7 = SchoolClass.create!(grade_lvl:4, section:"A", location:l7, academic_year_id:year.id)
c8 = SchoolClass.create!(grade_lvl:4, section:"B", location:l8, academic_year_id:year.id)
c9 = SchoolClass.create!(grade_lvl:5, section:"A", location:l9, academic_year_id:year.id)
c10 = SchoolClass.create!(grade_lvl:5, section:"B", location:l10, academic_year_id:year.id)

# =============================
# ClassSubjects (10)
# =============================
cs1 = ClassSubject.create!(school_class:c1, subject:s1, academic_year_id:year.id, credit:4)
cs2 = ClassSubject.create!(school_class:c2, subject:s2, academic_year_id:year.id, credit:4)
cs3 = ClassSubject.create!(school_class:c3, subject:s3, academic_year_id:year.id, credit:4)
cs4 = ClassSubject.create!(school_class:c4, subject:s4, academic_year_id:year.id, credit:4)
cs5 = ClassSubject.create!(school_class:c5, subject:s5, academic_year_id:year.id, credit:4)
cs6 = ClassSubject.create!(school_class:c6, subject:s6, academic_year_id:year.id, credit:4)
cs7 = ClassSubject.create!(school_class:c7, subject:s7, academic_year_id:year.id, credit:4)
cs8 = ClassSubject.create!(school_class:c8, subject:s8, academic_year_id:year.id, credit:4)
cs9 = ClassSubject.create!(school_class:c9, subject:s9, academic_year_id:year.id, credit:4)
cs10 = ClassSubject.create!(school_class:c10, subject:s10, academic_year_id:year.id, credit:4)

# =============================
# Teacher Assignments
# =============================
TeacherAssignment.create!(teacher:t1, class_subject:cs1, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t2, class_subject:cs2, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t3, class_subject:cs3, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t4, class_subject:cs4, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t5, class_subject:cs5, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t6, class_subject:cs6, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t7, class_subject:cs7, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t8, class_subject:cs8, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t9, class_subject:cs9, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t10, class_subject:cs10, academic_year_id:year.id)

# =============================
# Students (10)
# =============================
st1 = Student.create!(name:"S1", phone:"1001234561", password:"123456", address: "Pune", dob: "10/11/2003")
st2 = Student.create!(name:"S2", phone:"1001234562", password:"123456", address: "Pune", dob: "10/11/2003")
st3 = Student.create!(name:"S3", phone:"1001234563", password:"123456", address: "Pune", dob: "10/11/2003")
st4 = Student.create!(name:"S4", phone:"1001234564", password:"123456", address: "Pune", dob: "10/11/2003")
st5 = Student.create!(name:"S5", phone:"1001234565", password:"123456", address: "Pune", dob: "10/11/2003")
st6 = Student.create!(name:"S6", phone:"1001234566", password:"123456", address: "Pune", dob: "10/11/2003")
st7 = Student.create!(name:"S7", phone:"1001234567", password:"123456", address: "Pune", dob: "10/11/2003")
st8 = Student.create!(name:"S8", phone:"1001234568", password:"123456", address: "Pune", dob: "10/11/2003")
st9 = Student.create!(name:"S9", phone:"1001234569", password:"123456", address: "Pune", dob: "10/11/2003")
st10 = Student.create!(name:"S10", phone:"1010101010", password:"123456", address: "Pune", dob: "10/11/2003")

# =============================
# Enrollments
# =============================
Enrollment.create!(student:st1, school_class:c1, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st2, school_class:c2, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st3, school_class:c3, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st4, school_class:c4, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st5, school_class:c5, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st6, school_class:c6, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st7, school_class:c7, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st8, school_class:c8, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st9, school_class:c9, academic_year_id:year.id, status: "active")
Enrollment.create!(student:st10, school_class:c10, academic_year_id:year.id, status: "active")

# =============================
# Timetable (NO CONFLICT)
# =============================
Timetable.create!(class_subject:cs1, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts1)
Timetable.create!(class_subject:cs2, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts2)
Timetable.create!(class_subject:cs3, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts3)
Timetable.create!(class_subject:cs4, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts4)
Timetable.create!(class_subject:cs5, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts5)
Timetable.create!(class_subject:cs6, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts1)
Timetable.create!(class_subject:cs7, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts2)
Timetable.create!(class_subject:cs8, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts3)
Timetable.create!(class_subject:cs9, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts4)
Timetable.create!(class_subject:cs10, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts5)

# =============================
# Clubs
# =============================
club1 = Club.create!(name:"Science Club", teacher:t1, category:"science")
club2 = Club.create!(name:"Math Club", teacher:t2, category:"math")

# =============================
# Club Members
# =============================
ClubMember.create!(student:st1, club:club1, academic_year_id:year.id, role: "member")
ClubMember.create!(student:st2, club:club1, academic_year_id:year.id, role: "member")
ClubMember.create!(student:st3, club:club2, academic_year_id:year.id, role: "member")
ClubMember.create!(student:st4, club:club2, academic_year_id:year.id, role: "member")

# =============================
# Club Schedule
# =============================
ClubSchedule.create!(club:club1, activity_type:"Experiment", schedule_date:Date.today+1, start_time:"16:00", end_time:"17:00", location:l10)
ClubSchedule.create!(club:club2, activity_type:"Practice", schedule_date:Date.today+2, start_time:"16:00", end_time:"17:00", location:l9)

puts "FULL HARD SEEDED SUCCESSFULLY"