# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require './spec/fixtures/department_data'
require './spec/fixtures/employee_data'
require './spec/fixtures/ticket_data'

include DepartmentData
include EmployeeData
include TicketData

@dept_1 = Department.create!(DEPT_1)
@dept_2 = Department.create!(DEPT_2)
@dept_3 = Department.create!(DEPT_3)

@employee_1 = @dept_1.employees.create!(EMPLOYEE_1)
@employee_2 = @dept_1.employees.create!(EMPLOYEE_2)
@employee_3 = @dept_2.employees.create!(EMPLOYEE_3)
@employee_4 = @dept_2.employees.create!(EMPLOYEE_4)
@employee_5 = @dept_3.employees.create!(EMPLOYEE_5)

@ticket_1 = Ticket.create!(TICKET_1)
@ticket_2 = Ticket.create!(TICKET_2)
@ticket_3 = Ticket.create!(TICKET_3)
@ticket_4 = Ticket.create!(TICKET_4)
@ticket_5 = Ticket.create!(TICKET_5)

@employee_ticket_1 = EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_1.id)
@employee_ticket_2 = EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_1.id)
@employee_ticket_3 = EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_2.id)
@employee_ticket_4 = EmployeeTicket.create!(employee_id: @employee_3.id, ticket_id: @ticket_2.id)
@employee_ticket_5 = EmployeeTicket.create!(employee_id: @employee_3.id, ticket_id: @ticket_3.id)
@employee_ticket_6 = EmployeeTicket.create!(employee_id: @employee_4.id, ticket_id: @ticket_3.id)
@employee_ticket_7 = EmployeeTicket.create!(employee_id: @employee_4.id, ticket_id: @ticket_4.id)
@employee_ticket_8 = EmployeeTicket.create!(employee_id: @employee_5.id, ticket_id: @ticket_4.id)
@employee_ticket_9 = EmployeeTicket.create!(employee_id: @employee_5.id, ticket_id: @ticket_5.id)
