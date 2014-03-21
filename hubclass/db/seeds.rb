# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create([username: 'admin', user_id: '001', email: 'hubadmin@gmail.com', password: '123456', role: 'admin'])

students1 = User.create([
                        {username: '龚铭', user_id: 'u201015824', email: 'gongmingqm10@gmail.com', password: '123456', role: 'student'},
                        {username: '邓万江', user_id: 'u201015818', email: 'wjdeng@gmail.com', password: '123456', role: 'student'},
                        {username: '叶凯', user_id: 'u201015836', email: 'kaiye@gmail.com', password: '123456', role: 'student'},
                        {username: '刘良良', user_id: 'u201010107', email: 'llliu@gmail.com', password: '123456', role: 'student'},
                        {username: '梅诗进', user_id: 'u201010818', email: 'shijinm@gmail.com', password: '123456', role: 'student'},
                      ])

students2 = User.create([
                            {username: '杜泽新', user_id: 'u201016049', email: 'zexindu@gmail.com', password: '123456', role: 'student'},
                            {username: '黄振森', user_id: 'u201015863', email: 'zhensenw@gmail.com', password: '123456', role: 'student'},
                            {username: '马凌寒', user_id: 'u201016077', email: 'linhanm@gmail.com', password: '123456', role: 'student'},
                            {username: '邱冬', user_id: 'u201016082', email: 'dongq@gmail.com', password: '123456', role: 'student'},
                            {username: '曾令东', user_id: 'u201016076', email: 'lingdongz@gmail.com', password: '123456', role: 'student'},
                            {username: '曹超超', user_id: 'u201016073', email: 'chaochaoc@gmail.com', password: '123456', role: 'student'},
                            {username: '王成', user_id: 'u201015822', email: 'chengwang@gmail.com', password: '123456', role: 'student'}
                        ])

teachers = User.create([
                        {username: '程海芳', user_id: '199710001', email: 'hfcheng@gmail.com', password: '123456', role: 'teacher'},
                        {username: '马辉明', user_id: '199500002', email: 'hmma@gmail.com', password: '123456', role: 'teacher'},
                        {username: '汪湫泓', user_id: '200601102', email: 'qhwang@gmail.com', password: '123456', role: 'teacher'}
                      ])

courses = Course.create([
                        {name: '信息管理与信息系统', abstract: '主要学习经济、管理、数量分析方法、信息资源管理、计算机及信息系统方面的基本理论和基本知识，受到系统和设计方法以及信息管理方法的基本训练，具备综合运用所学知识分析和解决问题的基本能力'},
                        {name: '数据库技术与应用', abstract: '以当前主流的关系数据库为主线，全面介绍了数据库技术的基本内容。全书共10章，分别为数据库基础知识，信息的三种世界与数据模型，关系模型，sql server 2008关系数据库管理系统，关系数据库标准语言——sql，数据库保护，关系数据库理论，数据库系统的设计，数据库高级应用技术，数据库技术的发展趋势'},
                        {name: '计算机网络及应用', abstract: '计算机网络，是指将地理位置不同的具有独立功能的多台计算机及其外部设备，通过通信线路连接起来，在网络操作系统，网络管理软件及网络通信协议的管理和协调下，实现资源共享和信息传递的计算机系统'}
                      ])

group1 = Group.create({
                        name: '管实1001班课堂-信息管理及系统',
                        abstract: '管实1001小课堂教学',
                        course: courses.first,
                        teacher: teachers.first,
                        members: students1
                     })

group2 = Group.create({
                        name: '管实1002班课堂－信息管理及系统',
                        abstract: '管实1002小课堂教学',
                        course: courses.first,
                        teacher: teachers.first,
                        members: students2
                     })

group3 = Group.create({
                        name: '管实1001班课堂-计算机网络',
                        abstract: '管实1001小课堂教学',
                        course: courses.last,
                        teacher: teachers.first,
                        members: students2
                     })

group4 = Group.create({
                        name: '管实10级-数据库技术与应用',
                        abstract: '管实10级综合大课堂教学',
                        course: courses[1],
                        teacher: teachers.first,
                        members: students1.concat(students2)
                     })

puts 'groups, users and courses are saved successfully.'