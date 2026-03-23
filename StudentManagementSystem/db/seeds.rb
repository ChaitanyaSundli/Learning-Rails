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
d3 = Department.create!(name:"IT")
d4 = Department.create!(name:"Physical Edication")
d5 = Department.create!(name:"Accounts")
d6 = Department.create!(name:"Admin")

# =============================
# Teachers (10)
# =============================
t1 = Teacher.create!(name: "Amit Sharma", email: "amit.sharma@school.com", phone: "9876543210", department: d1, password: "123456")
t2 = Teacher.create!(name: "Priya Verma", email: "priya.verma@school.com", phone: "9876543211", department: d2, password: "123456")
t3 = Teacher.create!(name: "Rahul Mehta", email: "rahul.mehta@school.com", phone: "9876543212", department: d3, password: "123456")
t4 = Teacher.create!(name: "Sneha Iyer", email: "sneha.iyer@school.com", phone: "9876543213", department: d1, password: "123456")
t5 = Teacher.create!(name: "Vikram Singh", email: "vikram.singh@school.com", phone: "9876543214", department: d4, password: "123456")
t6 = Teacher.create!(name: "Neha Kapoor", email: "neha.kapoor@school.com", phone: "9876543215", department: d3, password: "123456")
t7 = Teacher.create!(name: "Arjun Nair", email: "arjun.nair@school.com", phone: "9876543216", department: d1, password: "123456")
t8 = Teacher.create!(name: "Kavita Joshi", email: "kavita.joshi@school.com", phone: "9876543217", department: d2, password: "123456")
t9 = Teacher.create!(name: "Rohit Gupta", email: "rohit.gupta@school.com", phone: "9876543218", department: d3, password: "123456")
t10 = Teacher.create!(name: "Pooja Desai", email: "pooja.desai@school.com", phone: "9876543219", department: d1, password: "123456")
t11 = Teacher.create!(name: "Manish Patel", email: "manish.patel@school.com", phone: "9876543220", department: d4, password: "123456")
t12 = Teacher.create!(name: "Anita Kulkarni", email: "anita.kulkarni@school.com", phone: "9876543221", department: d5, password: "123456")
t13 = Teacher.create!(name: "Suresh Reddy", email: "suresh.reddy@school.com", phone: "9876543222", department: d6, password: "123456")
t14 = Teacher.create!(name: "Deepika Shah", email: "deepika.shah@school.com", phone: "9876543223", department: d4, password: "123456")
t15 = Teacher.create!(name: "Karan Malhotra", email: "karan.malhotra@school.com", phone: "9876543224", department: d5, password: "123456")

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
# c1 → s1–s5
cs1 = ClassSubject.create!(school_class:c1, subject:s1, academic_year_id:year.id, credit:4)
cs2 = ClassSubject.create!(school_class:c1, subject:s2, academic_year_id:year.id, credit:4)
cs3 = ClassSubject.create!(school_class:c1, subject:s3, academic_year_id:year.id, credit:4)
cs4 = ClassSubject.create!(school_class:c1, subject:s4, academic_year_id:year.id, credit:4)
cs5 = ClassSubject.create!(school_class:c1, subject:s5, academic_year_id:year.id, credit:4)

# c2 → s2–s6
cs6 = ClassSubject.create!(school_class:c2, subject:s2, academic_year_id:year.id, credit:4)
cs7 = ClassSubject.create!(school_class:c2, subject:s3, academic_year_id:year.id, credit:4)
cs8 = ClassSubject.create!(school_class:c2, subject:s4, academic_year_id:year.id, credit:4)
cs9 = ClassSubject.create!(school_class:c2, subject:s5, academic_year_id:year.id, credit:4)
cs10 = ClassSubject.create!(school_class:c2, subject:s6, academic_year_id:year.id, credit:4)

# c3 → s3–s7
cs11 = ClassSubject.create!(school_class:c3, subject:s3, academic_year_id:year.id, credit:4)
cs12 = ClassSubject.create!(school_class:c3, subject:s4, academic_year_id:year.id, credit:4)
cs13 = ClassSubject.create!(school_class:c3, subject:s5, academic_year_id:year.id, credit:4)
cs14 = ClassSubject.create!(school_class:c3, subject:s6, academic_year_id:year.id, credit:4)
cs15 = ClassSubject.create!(school_class:c3, subject:s7, academic_year_id:year.id, credit:4)

# c4 → s4–s8
cs16 = ClassSubject.create!(school_class:c4, subject:s4, academic_year_id:year.id, credit:4)
cs17 = ClassSubject.create!(school_class:c4, subject:s5, academic_year_id:year.id, credit:4)
cs18 = ClassSubject.create!(school_class:c4, subject:s6, academic_year_id:year.id, credit:4)
cs19 = ClassSubject.create!(school_class:c4, subject:s7, academic_year_id:year.id, credit:4)
cs20 = ClassSubject.create!(school_class:c4, subject:s8, academic_year_id:year.id, credit:4)

# c5 → s5–s9
cs21 = ClassSubject.create!(school_class:c5, subject:s5, academic_year_id:year.id, credit:4)
cs22 = ClassSubject.create!(school_class:c5, subject:s6, academic_year_id:year.id, credit:4)
cs23 = ClassSubject.create!(school_class:c5, subject:s7, academic_year_id:year.id, credit:4)
cs24 = ClassSubject.create!(school_class:c5, subject:s8, academic_year_id:year.id, credit:4)
cs25 = ClassSubject.create!(school_class:c5, subject:s9, academic_year_id:year.id, credit:4)

# c6 → s6–s10
cs26 = ClassSubject.create!(school_class:c6, subject:s6, academic_year_id:year.id, credit:4)
cs27 = ClassSubject.create!(school_class:c6, subject:s7, academic_year_id:year.id, credit:4)
cs28 = ClassSubject.create!(school_class:c6, subject:s8, academic_year_id:year.id, credit:4)
cs29 = ClassSubject.create!(school_class:c6, subject:s9, academic_year_id:year.id, credit:4)
cs30 = ClassSubject.create!(school_class:c6, subject:s10, academic_year_id:year.id, credit:4)

# c7 → s7–s1 (rotation)
cs31 = ClassSubject.create!(school_class:c7, subject:s7, academic_year_id:year.id, credit:4)
cs32 = ClassSubject.create!(school_class:c7, subject:s8, academic_year_id:year.id, credit:4)
cs33 = ClassSubject.create!(school_class:c7, subject:s9, academic_year_id:year.id, credit:4)
cs34 = ClassSubject.create!(school_class:c7, subject:s10, academic_year_id:year.id, credit:4)
cs35 = ClassSubject.create!(school_class:c7, subject:s1, academic_year_id:year.id, credit:4)

# c8 → s8–s2
cs36 = ClassSubject.create!(school_class:c8, subject:s8, academic_year_id:year.id, credit:4)
cs37 = ClassSubject.create!(school_class:c8, subject:s9, academic_year_id:year.id, credit:4)
cs38 = ClassSubject.create!(school_class:c8, subject:s10, academic_year_id:year.id, credit:4)
cs39 = ClassSubject.create!(school_class:c8, subject:s1, academic_year_id:year.id, credit:4)
cs40 = ClassSubject.create!(school_class:c8, subject:s2, academic_year_id:year.id, credit:4)

# c9 → s9–s3
cs41 = ClassSubject.create!(school_class:c9, subject:s9, academic_year_id:year.id, credit:4)
cs42 = ClassSubject.create!(school_class:c9, subject:s10, academic_year_id:year.id, credit:4)
cs43 = ClassSubject.create!(school_class:c9, subject:s1, academic_year_id:year.id, credit:4)
cs44 = ClassSubject.create!(school_class:c9, subject:s2, academic_year_id:year.id, credit:4)
cs45 = ClassSubject.create!(school_class:c9, subject:s3, academic_year_id:year.id, credit:4)

# c10 → s10–s4
cs46 = ClassSubject.create!(school_class:c10, subject:s10, academic_year_id:year.id, credit:4)
cs47 = ClassSubject.create!(school_class:c10, subject:s1, academic_year_id:year.id, credit:4)
cs48 = ClassSubject.create!(school_class:c10, subject:s2, academic_year_id:year.id, credit:4)
cs49 = ClassSubject.create!(school_class:c10, subject:s3, academic_year_id:year.id, credit:4)
cs50 = ClassSubject.create!(school_class:c10, subject:s4, academic_year_id:year.id, credit:4)
# =============================
# Teacher Assignments
# =============================
TeacherAssignment.create!(teacher:t1, class_subject:cs1, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t1, class_subject:cs2, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t1, class_subject:cs3, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t1, class_subject:cs4, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t1, class_subject:cs5, academic_year_id:year.id)

TeacherAssignment.create!(teacher:t2, class_subject:cs6, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t2, class_subject:cs7, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t2, class_subject:cs8, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t2, class_subject:cs9, academic_year_id:year.id)
TeacherAssignment.create!(teacher:t2, class_subject:cs10, academic_year_id:year.id)

# repeat same pattern for all classes...

# =============================
# Students (10)
# =============================
st1 = Student.create!(name:"Aarav Sharma", phone:"9000000001", password:"123456", address:"Mumbai", dob: Date.new(2003,5,12))
st2 = Student.create!(name:"Vivaan Patel", phone:"9000000002", password:"123456", address:"Pune", dob: Date.new(2004,3,22))
st3 = Student.create!(name:"Aditya Verma", phone:"9000000003", password:"123456", address:"Delhi", dob: Date.new(2003,7,18))
st4 = Student.create!(name:"Vihaan Gupta", phone:"9000000004", password:"123456", address:"Ahmedabad", dob: Date.new(2004,1,9))
st5 = Student.create!(name:"Arjun Singh", phone:"9000000005", password:"123456", address:"Jaipur", dob: Date.new(2003,11,30))

st6 = Student.create!(name:"Sai Kumar", phone:"9000000006", password:"123456", address:"Hyderabad", dob: Date.new(2004,6,15))
st7 = Student.create!(name:"Krishna Iyer", phone:"9000000007", password:"123456", address:"Chennai", dob: Date.new(2003,9,10))
st8 = Student.create!(name:"Rohan Das", phone:"9000000008", password:"123456", address:"Kolkata", dob: Date.new(2004,2,25))
st9 = Student.create!(name:"Karan Mehta", phone:"9000000009", password:"123456", address:"Surat", dob: Date.new(2003,8,5))
st10 = Student.create!(name:"Yash Jain", phone:"9000000010", password:"123456", address:"Indore", dob: Date.new(2004,4,14))

st11 = Student.create!(name:"Ishaan Reddy", phone:"9000000011", password:"123456", address:"Bangalore", dob: Date.new(2003,12,1))
st12 = Student.create!(name:"Manav Shah", phone:"9000000012", password:"123456", address:"Vadodara", dob: Date.new(2004,5,19))
st13 = Student.create!(name:"Dev Malhotra", phone:"9000000013", password:"123456", address:"Chandigarh", dob: Date.new(2003,6,27))
st14 = Student.create!(name:"Aryan Nair", phone:"9000000014", password:"123456", address:"Kochi", dob: Date.new(2004,7,11))
st15 = Student.create!(name:"Harsh Vyas", phone:"9000000015", password:"123456", address:"Nagpur", dob: Date.new(2003,10,3))

st16 = Student.create!(name:"Rahul Kulkarni", phone:"9000000016", password:"123456", address:"Pune", dob: Date.new(2004,1,21))
st17 = Student.create!(name:"Ankit Choudhary", phone:"9000000017", password:"123456", address:"Bhopal", dob: Date.new(2003,3,17))
st18 = Student.create!(name:"Mohit Saxena", phone:"9000000018", password:"123456", address:"Lucknow", dob: Date.new(2004,8,8))
st19 = Student.create!(name:"Siddharth Joshi", phone:"9000000019", password:"123456", address:"Nashik", dob: Date.new(2003,2,13))
st20 = Student.create!(name:"Nikhil Agarwal", phone:"9000000020", password:"123456", address:"Kanpur", dob: Date.new(2004,9,29))

st21 = Student.create!(name:"Ananya Sharma", phone:"9000000021", password:"123456", address:"Mumbai", dob: Date.new(2003,6,6))
st22 = Student.create!(name:"Diya Patel", phone:"9000000022", password:"123456", address:"Surat", dob: Date.new(2004,11,12))
st23 = Student.create!(name:"Saanvi Verma", phone:"9000000023", password:"123456", address:"Delhi", dob: Date.new(2003,5,25))
st24 = Student.create!(name:"Aadhya Gupta", phone:"9000000024", password:"123456", address:"Jaipur", dob: Date.new(2004,7,30))
st25 = Student.create!(name:"Ira Singh", phone:"9000000025", password:"123456", address:"Chandigarh", dob: Date.new(2003,1,4))

st26 = Student.create!(name:"Myra Kapoor", phone:"9000000026", password:"123456", address:"Delhi", dob: Date.new(2004,3,9))
st27 = Student.create!(name:"Riya Iyer", phone:"9000000027", password:"123456", address:"Chennai", dob: Date.new(2003,9,19))
st28 = Student.create!(name:"Kavya Das", phone:"9000000028", password:"123456", address:"Kolkata", dob: Date.new(2004,6,23))
st29 = Student.create!(name:"Pooja Mehta", phone:"9000000029", password:"123456", address:"Ahmedabad", dob: Date.new(2003,8,14))
st30 = Student.create!(name:"Sneha Jain", phone:"9000000030", password:"123456", address:"Indore", dob: Date.new(2004,2,2))

st31 = Student.create!(name:"Ishita Reddy", phone:"9000000031", password:"123456", address:"Hyderabad", dob: Date.new(2003,4,28))
st32 = Student.create!(name:"Tanvi Shah", phone:"9000000032", password:"123456", address:"Vadodara", dob: Date.new(2004,10,6))
st33 = Student.create!(name:"Neha Malhotra", phone:"9000000033", password:"123456", address:"Chandigarh", dob: Date.new(2003,12,20))
st34 = Student.create!(name:"Priya Nair", phone:"9000000034", password:"123456", address:"Kochi", dob: Date.new(2004,5,13))
st35 = Student.create!(name:"Simran Vyas", phone:"9000000035", password:"123456", address:"Nagpur", dob: Date.new(2003,7,7))

st36 = Student.create!(name:"Aarti Kulkarni", phone:"9000000036", password:"123456", address:"Pune", dob: Date.new(2004,1,1))
st37 = Student.create!(name:"Komal Choudhary", phone:"9000000037", password:"123456", address:"Bhopal", dob: Date.new(2003,3,3))
st38 = Student.create!(name:"Megha Saxena", phone:"9000000038", password:"123456", address:"Lucknow", dob: Date.new(2004,9,9))
st39 = Student.create!(name:"Shruti Joshi", phone:"9000000039", password:"123456", address:"Nashik", dob: Date.new(2003,11,11))
st40 = Student.create!(name:"Naina Agarwal", phone:"9000000040", password:"123456", address:"Kanpur", dob: Date.new(2004,6,6))

st41 = Student.create!(name:"Kabir Khan", phone:"9000000041", password:"123456", address:"Mumbai", dob: Date.new(2003,5,5))
st42 = Student.create!(name:"Reyansh Ali", phone:"9000000042", password:"123456", address:"Delhi", dob: Date.new(2004,7,7))
st43 = Student.create!(name:"Zayan Sheikh", phone:"9000000043", password:"123456", address:"Hyderabad", dob: Date.new(2003,9,9))
st44 = Student.create!(name:"Ayaan Ansari", phone:"9000000044", password:"123456", address:"Lucknow", dob: Date.new(2004,2,14))
st45 = Student.create!(name:"Faizan Qureshi", phone:"9000000045", password:"123456", address:"Bhopal", dob: Date.new(2003,8,18))

st46 = Student.create!(name:"Imran Pathan", phone:"9000000046", password:"123456", address:"Surat", dob: Date.new(2004,4,4))
st47 = Student.create!(name:"Sameer Khan", phone:"9000000047", password:"123456", address:"Mumbai", dob: Date.new(2003,6,16))
st48 = Student.create!(name:"Armaan Siddiqui", phone:"9000000048", password:"123456", address:"Delhi", dob: Date.new(2004,10,10))
st49 = Student.create!(name:"Danish Shaikh", phone:"9000000049", password:"123456", address:"Pune", dob: Date.new(2003,12,12))
st50 = Student.create!(name:"Hassan Mirza", phone:"9000000050", password:"123456", address:"Hyderabad", dob: Date.new(2004,3,3))
# =============================
# Enrollments
# =============================
Enrollment.create!(student:st1, school_class:c1, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st2, school_class:c2, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st3, school_class:c3, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st4, school_class:c4, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st5, school_class:c5, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st6, school_class:c6, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st7, school_class:c7, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st8, school_class:c8, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st9, school_class:c9, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st10, school_class:c10, academic_year_id:year.id, status:"active")

Enrollment.create!(student:st11, school_class:c1, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st12, school_class:c2, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st13, school_class:c3, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st14, school_class:c4, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st15, school_class:c5, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st16, school_class:c6, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st17, school_class:c7, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st18, school_class:c8, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st19, school_class:c9, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st20, school_class:c10, academic_year_id:year.id, status:"active")

Enrollment.create!(student:st21, school_class:c1, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st22, school_class:c2, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st23, school_class:c3, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st24, school_class:c4, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st25, school_class:c5, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st26, school_class:c6, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st27, school_class:c7, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st28, school_class:c8, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st29, school_class:c9, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st30, school_class:c10, academic_year_id:year.id, status:"active")

Enrollment.create!(student:st31, school_class:c1, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st32, school_class:c2, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st33, school_class:c3, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st34, school_class:c4, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st35, school_class:c5, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st36, school_class:c6, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st37, school_class:c7, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st38, school_class:c8, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st39, school_class:c9, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st40, school_class:c10, academic_year_id:year.id, status:"active")

Enrollment.create!(student:st41, school_class:c1, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st42, school_class:c2, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st43, school_class:c3, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st44, school_class:c4, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st45, school_class:c5, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st46, school_class:c6, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st47, school_class:c7, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st48, school_class:c8, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st49, school_class:c9, academic_year_id:year.id, status:"active")
Enrollment.create!(student:st50, school_class:c10, academic_year_id:year.id, status:"active")
# =============================
# Timetable (NO CONFLICT)
# =============================
Timetable.create!(class_subject:cs1, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts1)
Timetable.create!(class_subject:cs2, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts1)
Timetable.create!(class_subject:cs3, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts1)
Timetable.create!(class_subject:cs4, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts1)
Timetable.create!(class_subject:cs5, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts1)

Timetable.create!(class_subject:cs6, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts2)
Timetable.create!(class_subject:cs7, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts2)
Timetable.create!(class_subject:cs8, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts2)
Timetable.create!(class_subject:cs9, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts2)
Timetable.create!(class_subject:cs10, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts2)

Timetable.create!(class_subject:cs11, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts3)
Timetable.create!(class_subject:cs12, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts3)
Timetable.create!(class_subject:cs13, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts3)
Timetable.create!(class_subject:cs14, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts3)
Timetable.create!(class_subject:cs15, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts3)

Timetable.create!(class_subject:cs16, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts4)
Timetable.create!(class_subject:cs17, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts4)
Timetable.create!(class_subject:cs18, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts4)
Timetable.create!(class_subject:cs19, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts4)
Timetable.create!(class_subject:cs20, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts4)

Timetable.create!(class_subject:cs21, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts5)
Timetable.create!(class_subject:cs22, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts5)
Timetable.create!(class_subject:cs23, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts5)
Timetable.create!(class_subject:cs24, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts5)
Timetable.create!(class_subject:cs25, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts5)

Timetable.create!(class_subject:cs26, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts6)
Timetable.create!(class_subject:cs27, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts6)
Timetable.create!(class_subject:cs28, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts6)
Timetable.create!(class_subject:cs29, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts6)
Timetable.create!(class_subject:cs30, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts6)

Timetable.create!(class_subject:cs31, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts7)
Timetable.create!(class_subject:cs32, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts7)
Timetable.create!(class_subject:cs33, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts7)
Timetable.create!(class_subject:cs34, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts7)
Timetable.create!(class_subject:cs35, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts7)

Timetable.create!(class_subject:cs36, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts8)
Timetable.create!(class_subject:cs37, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts8)
Timetable.create!(class_subject:cs38, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts8)
Timetable.create!(class_subject:cs39, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts8)
Timetable.create!(class_subject:cs40, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts8)

Timetable.create!(class_subject:cs41, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts9)
Timetable.create!(class_subject:cs42, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts9)
Timetable.create!(class_subject:cs43, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts9)
Timetable.create!(class_subject:cs44, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts9)
Timetable.create!(class_subject:cs45, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts9)

Timetable.create!(class_subject:cs46, academic_year_id:year.id, day_of_week:"Monday", time_slot:ts10)
Timetable.create!(class_subject:cs47, academic_year_id:year.id, day_of_week:"Tuesday", time_slot:ts10)
Timetable.create!(class_subject:cs48, academic_year_id:year.id, day_of_week:"Wednesday", time_slot:ts10)
Timetable.create!(class_subject:cs49, academic_year_id:year.id, day_of_week:"Thursday", time_slot:ts10)
Timetable.create!(class_subject:cs50, academic_year_id:year.id, day_of_week:"Friday", time_slot:ts10)


# =============================
# Clubs
# =============================
club1 = Club.create!(name:"Science Club", teacher:t1, category:"science")
club2 = Club.create!(name:"Math Club", teacher:t2, category:"math")
club3 = Club.create!(name:"Computer Club", teacher:t3, category:"technology")
club4 = Club.create!(name:"Literature Club", teacher:t4, category:"literary")
club5 = Club.create!(name:"Drama Club", teacher:t5, category:"arts")
club6 = Club.create!(name:"Music Club", teacher:t6, category:"arts")
club7 = Club.create!(name:"Sports Club", teacher:t7, category:"sports")
club8 = Club.create!(name:"Eco Club", teacher:t8, category:"environment")
club10 = Club.create!(name:"Debate Club", teacher:t10, category:"communication")

# =============================
# Club Members
# =============================
ClubMember.create!(student:st1, club:club1, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st2, club:club1, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st3, club:club1, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st4, club:club1, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st5, club:club1, academic_year_id:year.id, role:"member")

ClubMember.create!(student:st6, club:club2, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st7, club:club2, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st8, club:club2, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st9, club:club2, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st10, club:club2, academic_year_id:year.id, role:"member")

ClubMember.create!(student:st11, club:club3, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st12, club:club3, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st13, club:club3, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st14, club:club3, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st15, club:club3, academic_year_id:year.id, role:"member")

ClubMember.create!(student:st16, club:club4, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st17, club:club4, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st18, club:club4, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st19, club:club4, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st20, club:club4, academic_year_id:year.id, role:"member")

ClubMember.create!(student:st21, club:club5, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st22, club:club5, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st23, club:club5, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st24, club:club5, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st25, club:club5, academic_year_id:year.id, role:"member")

ClubMember.create!(student:st26, club:club6, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st27, club:club6, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st28, club:club6, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st29, club:club6, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st30, club:club6, academic_year_id:year.id, role:"member")

ClubMember.create!(student:st31, club:club7, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st32, club:club7, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st33, club:club7, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st34, club:club7, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st35, club:club7, academic_year_id:year.id, role:"member")

ClubMember.create!(student:st36, club:club8, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st37, club:club8, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st38, club:club8, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st39, club:club8, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st40, club:club8, academic_year_id:year.id, role:"member")

ClubMember.create!(student:st46, club:club10, academic_year_id:year.id, role:"president")
ClubMember.create!(student:st47, club:club10, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st48, club:club10, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st49, club:club10, academic_year_id:year.id, role:"member")
ClubMember.create!(student:st50, club:club10, academic_year_id:year.id, role:"member")
# =============================
# Club Schedule
# =============================
ClubSchedule.create!(club:club1, activity_type:"Experiment", schedule_date:Date.today+1, start_time:"16:00", end_time:"17:00", location:l5)
ClubSchedule.create!(club:club2, activity_type:"Problem Solving", schedule_date:Date.today+2, start_time:"16:00", end_time:"17:00", location:l1)
ClubSchedule.create!(club:club3, activity_type:"Coding Practice", schedule_date:Date.today+3, start_time:"16:00", end_time:"17:00", location:l6)
ClubSchedule.create!(club:club4, activity_type:"Reading Session", schedule_date:Date.today+4, start_time:"16:00", end_time:"17:00", location:l2)
ClubSchedule.create!(club:club5, activity_type:"Drama Rehearsal", schedule_date:Date.today+5, start_time:"16:00", end_time:"17:00", location:l10)

ClubSchedule.create!(club:club6, activity_type:"Music Practice", schedule_date:Date.today+6, start_time:"16:00", end_time:"17:00", location:l7)
ClubSchedule.create!(club:club7, activity_type:"Sports Training", schedule_date:Date.today+7, start_time:"16:00", end_time:"17:00", location:l9)
ClubSchedule.create!(club:club8, activity_type:"Awareness Activity", schedule_date:Date.today+8, start_time:"16:00", end_time:"17:00", location:l3)
ClubSchedule.create!(club:club10, activity_type:"Debate Practice", schedule_date:Date.today+10, start_time:"16:00", end_time:"17:00", location:l4)

e1 = Exam.create!(class_subject:cs1, academic_year_id:year.id, exam_date:Date.today+1, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e2 = Exam.create!(class_subject:cs2, academic_year_id:year.id, exam_date:Date.today+2, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e3 = Exam.create!(class_subject:cs3, academic_year_id:year.id, exam_date:Date.today+3, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e4 = Exam.create!(class_subject:cs4, academic_year_id:year.id, exam_date:Date.today+4, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e5 = Exam.create!(class_subject:cs5, academic_year_id:year.id, exam_date:Date.today+5, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e6 = Exam.create!(class_subject:cs6, academic_year_id:year.id, exam_date:Date.today+6, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e7 = Exam.create!(class_subject:cs7, academic_year_id:year.id, exam_date:Date.today+7, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e8 = Exam.create!(class_subject:cs8, academic_year_id:year.id, exam_date:Date.today+8, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e9 = Exam.create!(class_subject:cs9, academic_year_id:year.id, exam_date:Date.today+9, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e10 = Exam.create!(class_subject:cs10, academic_year_id:year.id, exam_date:Date.today+10, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e11 = Exam.create!(class_subject:cs11, academic_year_id:year.id, exam_date:Date.today+11, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e12 = Exam.create!(class_subject:cs12, academic_year_id:year.id, exam_date:Date.today+12, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e13 = Exam.create!(class_subject:cs13, academic_year_id:year.id, exam_date:Date.today+13, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e14 = Exam.create!(class_subject:cs14, academic_year_id:year.id, exam_date:Date.today+14, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e15 = Exam.create!(class_subject:cs15, academic_year_id:year.id, exam_date:Date.today+15, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e16 = Exam.create!(class_subject:cs16, academic_year_id:year.id, exam_date:Date.today+16, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e17 = Exam.create!(class_subject:cs17, academic_year_id:year.id, exam_date:Date.today+17, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e18 = Exam.create!(class_subject:cs18, academic_year_id:year.id, exam_date:Date.today+18, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e19 = Exam.create!(class_subject:cs19, academic_year_id:year.id, exam_date:Date.today+19, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e20 = Exam.create!(class_subject:cs20, academic_year_id:year.id, exam_date:Date.today+20, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e21 = Exam.create!(class_subject:cs21, academic_year_id:year.id, exam_date:Date.today+21, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e22 = Exam.create!(class_subject:cs22, academic_year_id:year.id, exam_date:Date.today+22, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e23 = Exam.create!(class_subject:cs23, academic_year_id:year.id, exam_date:Date.today+23, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e24 = Exam.create!(class_subject:cs24, academic_year_id:year.id, exam_date:Date.today+24, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e25 = Exam.create!(class_subject:cs25, academic_year_id:year.id, exam_date:Date.today+25, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e26 = Exam.create!(class_subject:cs26, academic_year_id:year.id, exam_date:Date.today+26, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e27 = Exam.create!(class_subject:cs27, academic_year_id:year.id, exam_date:Date.today+27, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e28 = Exam.create!(class_subject:cs28, academic_year_id:year.id, exam_date:Date.today+28, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e29 = Exam.create!(class_subject:cs29, academic_year_id:year.id, exam_date:Date.today+29, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e30 = Exam.create!(class_subject:cs30, academic_year_id:year.id, exam_date:Date.today+30, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e31 = Exam.create!(class_subject:cs31, academic_year_id:year.id, exam_date:Date.today+31, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e32 = Exam.create!(class_subject:cs32, academic_year_id:year.id, exam_date:Date.today+32, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e33 = Exam.create!(class_subject:cs33, academic_year_id:year.id, exam_date:Date.today+33, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e34 = Exam.create!(class_subject:cs34, academic_year_id:year.id, exam_date:Date.today+34, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e35 = Exam.create!(class_subject:cs35, academic_year_id:year.id, exam_date:Date.today+35, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e36 = Exam.create!(class_subject:cs36, academic_year_id:year.id, exam_date:Date.today+36, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e37 = Exam.create!(class_subject:cs37, academic_year_id:year.id, exam_date:Date.today+37, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e38 = Exam.create!(class_subject:cs38, academic_year_id:year.id, exam_date:Date.today+38, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e39 = Exam.create!(class_subject:cs39, academic_year_id:year.id, exam_date:Date.today+39, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e40 = Exam.create!(class_subject:cs40, academic_year_id:year.id, exam_date:Date.today+40, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e41 = Exam.create!(class_subject:cs41, academic_year_id:year.id, exam_date:Date.today+41, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e42 = Exam.create!(class_subject:cs42, academic_year_id:year.id, exam_date:Date.today+42, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e43 = Exam.create!(class_subject:cs43, academic_year_id:year.id, exam_date:Date.today+43, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e44 = Exam.create!(class_subject:cs44, academic_year_id:year.id, exam_date:Date.today+44, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e45 = Exam.create!(class_subject:cs45, academic_year_id:year.id, exam_date:Date.today+45, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

e46 = Exam.create!(class_subject:cs46, academic_year_id:year.id, exam_date:Date.today+46, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts1)
e47 = Exam.create!(class_subject:cs47, academic_year_id:year.id, exam_date:Date.today+47, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts2)
e48 = Exam.create!(class_subject:cs48, academic_year_id:year.id, exam_date:Date.today+48, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts3)
e49 = Exam.create!(class_subject:cs49, academic_year_id:year.id, exam_date:Date.today+49, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts4)
e50 = Exam.create!(class_subject:cs50, academic_year_id:year.id, exam_date:Date.today+50, exam_type:"Midterm", max_mark:100, pass_mark:35, time_slot:ts5)

ExamResult.create!(exam:e1, student:st1, academic_year_id:year.id, marks_obtained:78 )
ExamResult.create!(exam:e1, student:st11, academic_year_id:year.id, marks_obtained:85)
ExamResult.create!(exam:e1, student:st21, academic_year_id:year.id, marks_obtained:67)
ExamResult.create!(exam:e1, student:st31, academic_year_id:year.id, marks_obtained:90)
ExamResult.create!(exam:e1, student:st41, academic_year_id:year.id, marks_obtained:72)
ExamResult.create!(exam:e2, student:st1, academic_year_id:year.id, marks_obtained:80 )
ExamResult.create!(exam:e2, student:st11, academic_year_id:year.id, marks_obtained:76)
ExamResult.create!(exam:e2, student:st21, academic_year_id:year.id, marks_obtained:69)
ExamResult.create!(exam:e2, student:st31, academic_year_id:year.id, marks_obtained:88)
ExamResult.create!(exam:e2, student:st41, academic_year_id:year.id, marks_obtained:74)
ExamResult.create!(exam:e3, student:st1, academic_year_id:year.id, marks_obtained:82 )
ExamResult.create!(exam:e3, student:st11, academic_year_id:year.id, marks_obtained:79)
ExamResult.create!(exam:e3, student:st21, academic_year_id:year.id, marks_obtained:71)
ExamResult.create!(exam:e3, student:st31, academic_year_id:year.id, marks_obtained:92)
ExamResult.create!(exam:e3, student:st41, academic_year_id:year.id, marks_obtained:70)
ExamResult.create!(exam:e4, student:st1, academic_year_id:year.id, marks_obtained:75 )
ExamResult.create!(exam:e4, student:st11, academic_year_id:year.id, marks_obtained:83)
ExamResult.create!(exam:e4, student:st21, academic_year_id:year.id, marks_obtained:65)
ExamResult.create!(exam:e4, student:st31, academic_year_id:year.id, marks_obtained:89)
ExamResult.create!(exam:e4, student:st41, academic_year_id:year.id, marks_obtained:73)
ExamResult.create!(exam:e5, student:st1, academic_year_id:year.id, marks_obtained:77 )
ExamResult.create!(exam:e5, student:st11, academic_year_id:year.id, marks_obtained:81)
ExamResult.create!(exam:e5, student:st21, academic_year_id:year.id, marks_obtained:68)
ExamResult.create!(exam:e5, student:st31, academic_year_id:year.id, marks_obtained:91)
ExamResult.create!(exam:e5, student:st41, academic_year_id:year.id, marks_obtained:72)
ExamResult.create!(exam:e6, student:st2, academic_year_id:year.id, marks_obtained:79 )
ExamResult.create!(exam:e6, student:st12, academic_year_id:year.id, marks_obtained:84)
ExamResult.create!(exam:e6, student:st22, academic_year_id:year.id, marks_obtained:66)
ExamResult.create!(exam:e6, student:st32, academic_year_id:year.id, marks_obtained:90)
ExamResult.create!(exam:e6, student:st42, academic_year_id:year.id, marks_obtained:73)
ExamResult.create!(exam:e7, student:st2, academic_year_id:year.id, marks_obtained:81 )
ExamResult.create!(exam:e7, student:st12, academic_year_id:year.id, marks_obtained:77)
ExamResult.create!(exam:e7, student:st22, academic_year_id:year.id, marks_obtained:69)
ExamResult.create!(exam:e7, student:st32, academic_year_id:year.id, marks_obtained:87)
ExamResult.create!(exam:e7, student:st42, academic_year_id:year.id, marks_obtained:75)
ExamResult.create!(exam:e8, student:st2, academic_year_id:year.id, marks_obtained:83 )
ExamResult.create!(exam:e8, student:st12, academic_year_id:year.id, marks_obtained:78)
ExamResult.create!(exam:e8, student:st22, academic_year_id:year.id, marks_obtained:70)
ExamResult.create!(exam:e8, student:st32, academic_year_id:year.id, marks_obtained:91)
ExamResult.create!(exam:e8, student:st42, academic_year_id:year.id, marks_obtained:71)
ExamResult.create!(exam:e9, student:st2, academic_year_id:year.id, marks_obtained:76 )
ExamResult.create!(exam:e9, student:st12, academic_year_id:year.id, marks_obtained:82)
ExamResult.create!(exam:e9, student:st22, academic_year_id:year.id, marks_obtained:67)
ExamResult.create!(exam:e9, student:st32, academic_year_id:year.id, marks_obtained:89)
ExamResult.create!(exam:e9, student:st42, academic_year_id:year.id, marks_obtained:74)
ExamResult.create!(exam:e10, student:st2, academic_year_id:year.id, marks_obtained:78)
ExamResult.create!(exam:e10, student:st12, academic_year_id:year.id, marks_obtained:80)
ExamResult.create!(exam:e10, student:st22, academic_year_id:year.id, marks_obtained:68)
ExamResult.create!(exam:e10, student:st32, academic_year_id:year.id, marks_obtained:90)
ExamResult.create!(exam:e10, student:st42, academic_year_id:year.id, marks_obtained:72)
ExamResult.create!(exam:e11, student:st3, academic_year_id:year.id, marks_obtained:78 )
ExamResult.create!(exam:e11, student:st13, academic_year_id:year.id, marks_obtained:85)
ExamResult.create!(exam:e11, student:st23, academic_year_id:year.id, marks_obtained:67)
ExamResult.create!(exam:e11, student:st33, academic_year_id:year.id, marks_obtained:90)
ExamResult.create!(exam:e11, student:st43, academic_year_id:year.id, marks_obtained:72)
ExamResult.create!(exam:e12, student:st3, academic_year_id:year.id, marks_obtained:80 )
ExamResult.create!(exam:e12, student:st13, academic_year_id:year.id, marks_obtained:76)
ExamResult.create!(exam:e12, student:st23, academic_year_id:year.id, marks_obtained:69)
ExamResult.create!(exam:e12, student:st33, academic_year_id:year.id, marks_obtained:88)
ExamResult.create!(exam:e12, student:st43, academic_year_id:year.id, marks_obtained:74)

ExamResult.create!(exam:e13, student:st3, academic_year_id:year.id, marks_obtained:82 )
ExamResult.create!(exam:e13, student:st13, academic_year_id:year.id, marks_obtained:79)
ExamResult.create!(exam:e13, student:st23, academic_year_id:year.id, marks_obtained:71)
ExamResult.create!(exam:e13, student:st33, academic_year_id:year.id, marks_obtained:92)
ExamResult.create!(exam:e13, student:st43, academic_year_id:year.id, marks_obtained:70)

ExamResult.create!(exam:e14, student:st3, academic_year_id:year.id, marks_obtained:75 )
ExamResult.create!(exam:e14, student:st13, academic_year_id:year.id, marks_obtained:83)
ExamResult.create!(exam:e14, student:st23, academic_year_id:year.id, marks_obtained:65)
ExamResult.create!(exam:e14, student:st33, academic_year_id:year.id, marks_obtained:89)
ExamResult.create!(exam:e14, student:st43, academic_year_id:year.id, marks_obtained:73)

ExamResult.create!(exam:e15, student:st3, academic_year_id:year.id, marks_obtained:77 )
ExamResult.create!(exam:e15, student:st13, academic_year_id:year.id, marks_obtained:81)
ExamResult.create!(exam:e15, student:st23, academic_year_id:year.id, marks_obtained:68)
ExamResult.create!(exam:e15, student:st33, academic_year_id:year.id, marks_obtained:91)
ExamResult.create!(exam:e15, student:st43, academic_year_id:year.id, marks_obtained:72)

ExamResult.create!(exam:e16, student:st4, academic_year_id:year.id, marks_obtained:78 )
ExamResult.create!(exam:e16, student:st14, academic_year_id:year.id, marks_obtained:85)
ExamResult.create!(exam:e16, student:st24, academic_year_id:year.id, marks_obtained:67)
ExamResult.create!(exam:e16, student:st34, academic_year_id:year.id, marks_obtained:90)
ExamResult.create!(exam:e16, student:st44, academic_year_id:year.id, marks_obtained:72)

ExamResult.create!(exam:e17, student:st4, academic_year_id:year.id, marks_obtained:80 )
ExamResult.create!(exam:e17, student:st14, academic_year_id:year.id, marks_obtained:76)
ExamResult.create!(exam:e17, student:st24, academic_year_id:year.id, marks_obtained:69)
ExamResult.create!(exam:e17, student:st34, academic_year_id:year.id, marks_obtained:88)
ExamResult.create!(exam:e17, student:st44, academic_year_id:year.id, marks_obtained:74)

ExamResult.create!(exam:e18, student:st4, academic_year_id:year.id, marks_obtained:82 )
ExamResult.create!(exam:e18, student:st14, academic_year_id:year.id, marks_obtained:79)
ExamResult.create!(exam:e18, student:st24, academic_year_id:year.id, marks_obtained:71)
ExamResult.create!(exam:e18, student:st34, academic_year_id:year.id, marks_obtained:92)
ExamResult.create!(exam:e18, student:st44, academic_year_id:year.id, marks_obtained:70)

ExamResult.create!(exam:e19, student:st4, academic_year_id:year.id, marks_obtained:75 )
ExamResult.create!(exam:e19, student:st14, academic_year_id:year.id, marks_obtained:83)
ExamResult.create!(exam:e19, student:st24, academic_year_id:year.id, marks_obtained:65)
ExamResult.create!(exam:e19, student:st34, academic_year_id:year.id, marks_obtained:89)
ExamResult.create!(exam:e19, student:st44, academic_year_id:year.id, marks_obtained:73)

ExamResult.create!(exam:e20, student:st4, academic_year_id:year.id, marks_obtained:77 )
ExamResult.create!(exam:e20, student:st14, academic_year_id:year.id, marks_obtained:81)
ExamResult.create!(exam:e20, student:st24, academic_year_id:year.id, marks_obtained:68)
ExamResult.create!(exam:e20, student:st34, academic_year_id:year.id, marks_obtained:91)
ExamResult.create!(exam:e20, student:st44, academic_year_id:year.id, marks_obtained:72)

ExamResult.create!(exam:e21, student:st5, academic_year_id:year.id, marks_obtained:78 )
ExamResult.create!(exam:e21, student:st15, academic_year_id:year.id, marks_obtained:85)
ExamResult.create!(exam:e21, student:st25, academic_year_id:year.id, marks_obtained:67)
ExamResult.create!(exam:e21, student:st35, academic_year_id:year.id, marks_obtained:90)
ExamResult.create!(exam:e21, student:st45, academic_year_id:year.id, marks_obtained:72)

ExamResult.create!(exam:e22, student:st5, academic_year_id:year.id, marks_obtained:80 )
ExamResult.create!(exam:e22, student:st15, academic_year_id:year.id, marks_obtained:76)
ExamResult.create!(exam:e22, student:st25, academic_year_id:year.id, marks_obtained:69)
ExamResult.create!(exam:e22, student:st35, academic_year_id:year.id, marks_obtained:88)
ExamResult.create!(exam:e22, student:st45, academic_year_id:year.id, marks_obtained:74)

ExamResult.create!(exam:e23, student:st5, academic_year_id:year.id, marks_obtained:82 )
ExamResult.create!(exam:e23, student:st15, academic_year_id:year.id, marks_obtained:79)
ExamResult.create!(exam:e23, student:st25, academic_year_id:year.id, marks_obtained:71)
ExamResult.create!(exam:e23, student:st35, academic_year_id:year.id, marks_obtained:92)
ExamResult.create!(exam:e23, student:st45, academic_year_id:year.id, marks_obtained:70)

ExamResult.create!(exam:e24, student:st5, academic_year_id:year.id, marks_obtained:75 )
ExamResult.create!(exam:e24, student:st15, academic_year_id:year.id, marks_obtained:83)
ExamResult.create!(exam:e24, student:st25, academic_year_id:year.id, marks_obtained:65)
ExamResult.create!(exam:e24, student:st35, academic_year_id:year.id, marks_obtained:89)
ExamResult.create!(exam:e24, student:st45, academic_year_id:year.id, marks_obtained:73)

ExamResult.create!(exam:e25, student:st5, academic_year_id:year.id, marks_obtained:77 )
ExamResult.create!(exam:e25, student:st15, academic_year_id:year.id, marks_obtained:81)
ExamResult.create!(exam:e25, student:st25, academic_year_id:year.id, marks_obtained:68)
ExamResult.create!(exam:e25, student:st35, academic_year_id:year.id, marks_obtained:91)
ExamResult.create!(exam:e25, student:st45, academic_year_id:year.id, marks_obtained:72)

ExamResult.create!(student:st31, exam:e6, academic_year_id:year.id, marks_obtained:75 )
ExamResult.create!(student:st31, exam:e7, academic_year_id:year.id, marks_obtained:82 )
ExamResult.create!(student:st31, exam:e8, academic_year_id:year.id, marks_obtained:69 )
ExamResult.create!(student:st31, exam:e9, academic_year_id:year.id, marks_obtained:88 )
ExamResult.create!(student:st31, exam:e10, academic_year_id:year.id, marks_obtained:91)

ExamResult.create!(student:st32, exam:e6, academic_year_id:year.id, marks_obtained:73 )
ExamResult.create!(student:st32, exam:e7, academic_year_id:year.id, marks_obtained:80 )
ExamResult.create!(student:st32, exam:e8, academic_year_id:year.id, marks_obtained:67 )
ExamResult.create!(student:st32, exam:e9, academic_year_id:year.id, marks_obtained:85 )
ExamResult.create!(student:st32, exam:e10, academic_year_id:year.id, marks_obtained:90)

ExamResult.create!(student:st33, exam:e11, academic_year_id:year.id, marks_obtained:78)
ExamResult.create!(student:st33, exam:e12, academic_year_id:year.id, marks_obtained:84)
ExamResult.create!(student:st33, exam:e13, academic_year_id:year.id, marks_obtained:72)
ExamResult.create!(student:st33, exam:e14, academic_year_id:year.id, marks_obtained:88)
ExamResult.create!(student:st33, exam:e15, academic_year_id:year.id, marks_obtained:91)

ExamResult.create!(student:st34, exam:e11, academic_year_id:year.id, marks_obtained:76)
ExamResult.create!(student:st34, exam:e12, academic_year_id:year.id, marks_obtained:82)
ExamResult.create!(student:st34, exam:e13, academic_year_id:year.id, marks_obtained:70)
ExamResult.create!(student:st34, exam:e14, academic_year_id:year.id, marks_obtained:86)
ExamResult.create!(student:st34, exam:e15, academic_year_id:year.id, marks_obtained:89)

ExamResult.create!(student:st35, exam:e16, academic_year_id:year.id, marks_obtained:79)
ExamResult.create!(student:st35, exam:e17, academic_year_id:year.id, marks_obtained:85)
ExamResult.create!(student:st35, exam:e18, academic_year_id:year.id, marks_obtained:73)
ExamResult.create!(student:st35, exam:e19, academic_year_id:year.id, marks_obtained:87)
ExamResult.create!(student:st35, exam:e20, academic_year_id:year.id, marks_obtained:92)

ExamResult.create!(student:st36, exam:e16, academic_year_id:year.id, marks_obtained:77)
ExamResult.create!(student:st36, exam:e17, academic_year_id:year.id, marks_obtained:83)
ExamResult.create!(student:st36, exam:e18, academic_year_id:year.id, marks_obtained:71)
ExamResult.create!(student:st36, exam:e19, academic_year_id:year.id, marks_obtained:85)
ExamResult.create!(student:st36, exam:e20, academic_year_id:year.id, marks_obtained:90)

ExamResult.create!(student:st37, exam:e21, academic_year_id:year.id, marks_obtained:80)
ExamResult.create!(student:st37, exam:e22, academic_year_id:year.id, marks_obtained:86)
ExamResult.create!(student:st37, exam:e23, academic_year_id:year.id, marks_obtained:74)
ExamResult.create!(student:st37, exam:e24, academic_year_id:year.id, marks_obtained:88)
ExamResult.create!(student:st37, exam:e25, academic_year_id:year.id, marks_obtained:93)

ExamResult.create!(student:st38, exam:e21, academic_year_id:year.id, marks_obtained:78)
ExamResult.create!(student:st38, exam:e22, academic_year_id:year.id, marks_obtained:84)
ExamResult.create!(student:st38, exam:e23, academic_year_id:year.id, marks_obtained:72)
ExamResult.create!(student:st38, exam:e24, academic_year_id:year.id, marks_obtained:86)
ExamResult.create!(student:st38, exam:e25, academic_year_id:year.id, marks_obtained:91)

ExamResult.create!(student:st39, exam:e26, academic_year_id:year.id, marks_obtained:81)
ExamResult.create!(student:st39, exam:e27, academic_year_id:year.id, marks_obtained:87)
ExamResult.create!(student:st39, exam:e28, academic_year_id:year.id, marks_obtained:75)
ExamResult.create!(student:st39, exam:e29, academic_year_id:year.id, marks_obtained:89)
ExamResult.create!(student:st39, exam:e30, academic_year_id:year.id, marks_obtained:94)

ExamResult.create!(student:st40, exam:e26, academic_year_id:year.id, marks_obtained:79)
ExamResult.create!(student:st40, exam:e27, academic_year_id:year.id, marks_obtained:85)
ExamResult.create!(student:st40, exam:e28, academic_year_id:year.id, marks_obtained:73)
ExamResult.create!(student:st40, exam:e29, academic_year_id:year.id, marks_obtained:87)
ExamResult.create!(student:st40, exam:e30, academic_year_id:year.id, marks_obtained:92)

ExamResult.create!(student:st41, exam:e31, academic_year_id:year.id, marks_obtained:82)
ExamResult.create!(student:st41, exam:e32, academic_year_id:year.id, marks_obtained:88)
ExamResult.create!(student:st41, exam:e33, academic_year_id:year.id, marks_obtained:76)
ExamResult.create!(student:st41, exam:e34, academic_year_id:year.id, marks_obtained:90)
ExamResult.create!(student:st41, exam:e35, academic_year_id:year.id, marks_obtained:95)

ExamResult.create!(student:st42, exam:e31, academic_year_id:year.id, marks_obtained:80)
ExamResult.create!(student:st42, exam:e32, academic_year_id:year.id, marks_obtained:86)
ExamResult.create!(student:st42, exam:e33, academic_year_id:year.id, marks_obtained:74)
ExamResult.create!(student:st42, exam:e34, academic_year_id:year.id, marks_obtained:88)
ExamResult.create!(student:st42, exam:e35, academic_year_id:year.id, marks_obtained:93)

ExamResult.create!(student:st43, exam:e36, academic_year_id:year.id, marks_obtained:83)
ExamResult.create!(student:st43, exam:e37, academic_year_id:year.id, marks_obtained:89)
ExamResult.create!(student:st43, exam:e38, academic_year_id:year.id, marks_obtained:77)
ExamResult.create!(student:st43, exam:e39, academic_year_id:year.id, marks_obtained:91)
ExamResult.create!(student:st43, exam:e40, academic_year_id:year.id, marks_obtained:96)

ExamResult.create!(student:st44, exam:e36, academic_year_id:year.id, marks_obtained:81)
ExamResult.create!(student:st44, exam:e37, academic_year_id:year.id, marks_obtained:87)
ExamResult.create!(student:st44, exam:e38, academic_year_id:year.id, marks_obtained:75)
ExamResult.create!(student:st44, exam:e39, academic_year_id:year.id, marks_obtained:89)
ExamResult.create!(student:st44, exam:e40, academic_year_id:year.id, marks_obtained:94)

ExamResult.create!(student:st45, exam:e41, academic_year_id:year.id, marks_obtained:84)
ExamResult.create!(student:st45, exam:e42, academic_year_id:year.id, marks_obtained:90)
ExamResult.create!(student:st45, exam:e43, academic_year_id:year.id, marks_obtained:78)
ExamResult.create!(student:st45, exam:e44, academic_year_id:year.id, marks_obtained:92)
ExamResult.create!(student:st45, exam:e45, academic_year_id:year.id, marks_obtained:97)

ExamResult.create!(student:st46, exam:e41, academic_year_id:year.id, marks_obtained:46)
ExamResult.create!(student:st46, exam:e42, academic_year_id:year.id, marks_obtained:46)
ExamResult.create!(student:st46, exam:e43, academic_year_id:year.id, marks_obtained:46)
ExamResult.create!(student:st46, exam:e44, academic_year_id:year.id, marks_obtained:46)
ExamResult.create!(student:st46, exam:e45, academic_year_id:year.id, marks_obtained:46)

ExamResult.create!(student:st47, exam:e46, academic_year_id:year.id, marks_obtained:00)
ExamResult.create!(student:st47, exam:e47, academic_year_id:year.id, marks_obtained:00)
ExamResult.create!(student:st47, exam:e48, academic_year_id:year.id, marks_obtained:00)
ExamResult.create!(student:st47, exam:e49, academic_year_id:year.id, marks_obtained:00)
ExamResult.create!(student:st47, exam:e50, academic_year_id:year.id, marks_obtained:00)

ExamResult.create!(student:st48, exam:e46, academic_year_id:year.id, marks_obtained:55)
ExamResult.create!(student:st48, exam:e47, academic_year_id:year.id, marks_obtained:55)
ExamResult.create!(student:st48, exam:e48, academic_year_id:year.id, marks_obtained:55)
ExamResult.create!(student:st48, exam:e49, academic_year_id:year.id, marks_obtained:55)
ExamResult.create!(student:st48, exam:e50, academic_year_id:year.id, marks_obtained:55)

ExamResult.create!(student:st49, exam:e46, academic_year_id:year.id, marks_obtained:61)
ExamResult.create!(student:st49, exam:e47, academic_year_id:year.id, marks_obtained:61)
ExamResult.create!(student:st49, exam:e48, academic_year_id:year.id, marks_obtained:61)
ExamResult.create!(student:st49, exam:e49, academic_year_id:year.id, marks_obtained:61)
ExamResult.create!(student:st49, exam:e50, academic_year_id:year.id, marks_obtained:61)

ExamResult.create!(student:st50, exam:e46, academic_year_id:year.id, marks_obtained:5)
ExamResult.create!(student:st50, exam:e47, academic_year_id:year.id, marks_obtained:50)
ExamResult.create!(student:st50, exam:e48, academic_year_id:year.id, marks_obtained:50)
ExamResult.create!(student:st50, exam:e49, academic_year_id:year.id, marks_obtained:50)
ExamResult.create!(student:st50, exam:e50, academic_year_id:year.id, marks_obtained:50)

Attendance.create!(student:st1, academic_year_id:year.id, date:Date.today-1,  status:"present")
Attendance.create!(student:st2, academic_year_id:year.id, date:Date.today-1,  status:"present")
Attendance.create!(student:st3, academic_year_id:year.id, date:Date.today-1,  status:"late")
Attendance.create!(student:st4, academic_year_id:year.id, date:Date.today-1,  status:"present")
Attendance.create!(student:st5, academic_year_id:year.id, date:Date.today-1,  status:"present")

Attendance.create!(student:st6, academic_year_id:year.id, date:Date.today-1,  status:"present")
Attendance.create!(student:st7, academic_year_id:year.id, date:Date.today-1,  status:"late")
Attendance.create!(student:st8, academic_year_id:year.id, date:Date.today-1,  status:"present")
Attendance.create!(student:st9, academic_year_id:year.id, date:Date.today-1,  status:"present")
Attendance.create!(student:st10, academic_year_id:year.id, date:Date.today-1, status:"present")

Attendance.create!(student:st1, academic_year_id:year.id, date:Date.today-4,  status:"present")
Attendance.create!(student:st2, academic_year_id:year.id, date:Date.today-4,  status:"absent")
Attendance.create!(student:st3, academic_year_id:year.id, date:Date.today-4,  status:"late")
Attendance.create!(student:st4, academic_year_id:year.id, date:Date.today-4,  status:"present")
Attendance.create!(student:st5, academic_year_id:year.id, date:Date.today-4,  status:"present")
Attendance.create!(student:st6, academic_year_id:year.id, date:Date.today-4,  status:"absent")
Attendance.create!(student:st7, academic_year_id:year.id, date:Date.today-4,  status:"late")
Attendance.create!(student:st8, academic_year_id:year.id, date:Date.today-4,  status:"present")
Attendance.create!(student:st9, academic_year_id:year.id, date:Date.today-4,  status:"present")
Attendance.create!(student:st10, academic_year_id:year.id, date:Date.today-4, status:"absent")

Attendance.create!(student:st11, academic_year_id:year.id, date:Date.today-5,  status:"present")
Attendance.create!(student:st12, academic_year_id:year.id, date:Date.today-5,  status:"late")
Attendance.create!(student:st13, academic_year_id:year.id, date:Date.today-5,  status:"present")
Attendance.create!(student:st14, academic_year_id:year.id, date:Date.today-5,  status:"absent")
Attendance.create!(student:st15, academic_year_id:year.id, date:Date.today-5,  status:"present")
Attendance.create!(student:st16, academic_year_id:year.id, date:Date.today-5,  status:"present")
Attendance.create!(student:st17, academic_year_id:year.id, date:Date.today-5,  status:"late")
Attendance.create!(student:st18, academic_year_id:year.id, date:Date.today-5,  status:"absent")
Attendance.create!(student:st19, academic_year_id:year.id, date:Date.today-5,  status:"present")
Attendance.create!(student:st20, academic_year_id:year.id, date:Date.today-5,  status:"present")

Attendance.create!(student:st21, academic_year_id:year.id, date:Date.today-6,  status:"late")
Attendance.create!(student:st22, academic_year_id:year.id, date:Date.today-6,  status:"present")
Attendance.create!(student:st23, academic_year_id:year.id, date:Date.today-6,  status:"absent")
Attendance.create!(student:st24, academic_year_id:year.id, date:Date.today-6,  status:"present")
Attendance.create!(student:st25, academic_year_id:year.id, date:Date.today-6,  status:"present")
Attendance.create!(student:st26, academic_year_id:year.id, date:Date.today-6,  status:"late")
Attendance.create!(student:st27, academic_year_id:year.id, date:Date.today-6,  status:"present")
Attendance.create!(student:st28, academic_year_id:year.id, date:Date.today-6,  status:"present")
Attendance.create!(student:st29, academic_year_id:year.id, date:Date.today-6,  status:"absent")
Attendance.create!(student:st30, academic_year_id:year.id, date:Date.today-6,  status:"present")

Attendance.create!(student:st21, academic_year_id:year.id, date:Date.today-7,  status:"late")
Attendance.create!(student:st22, academic_year_id:year.id, date:Date.today-7,  status:"present")
Attendance.create!(student:st23, academic_year_id:year.id, date:Date.today-7,  status:"absent")
Attendance.create!(student:st24, academic_year_id:year.id, date:Date.today-7,  status:"absent")
Attendance.create!(student:st25, academic_year_id:year.id, date:Date.today-7,  status:"absent")
Attendance.create!(student:st26, academic_year_id:year.id, date:Date.today-7,  status:"late")
Attendance.create!(student:st27, academic_year_id:year.id, date:Date.today-7,  status:"present")
Attendance.create!(student:st28, academic_year_id:year.id, date:Date.today-7,  status:"present")
Attendance.create!(student:st29, academic_year_id:year.id, date:Date.today-7,  status:"absent")
Attendance.create!(student:st30, academic_year_id:year.id, date:Date.today-7,  status:"present")
puts "FULL HARD SEEDED SUCCESSFULLY"