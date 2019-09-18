getwd()
all.files = list.files(include.dirs = FALSE,recursive = TRUE,full.names = TRUE)

dir.create("../../Desktop/Data_Course_Money/Practicepractice/")

to.path = "../../Desktop/Data_Course_Money/Practicepractice/"

file.copy(from = all.files,to=to.path)

list.files(to.path)


exampath = "~/Desktop/Data_Course_Money/Practicepractice/"
my.exampath = "~/Desktop/Data_Course_Money/Exam_1"

dir.create(my.exampath)

exam.files = list.files(exampath,pattern = ".txt",full.names = TRUE)
file.copy(exam.files, my.exampath)
list.files(my.exampath)
