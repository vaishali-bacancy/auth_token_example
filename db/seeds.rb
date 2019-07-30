# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ROLES=["admin","user"]    
ROLES.each do |role|     
	Role.find_or_create_by(name: role)   
end   
admin= User.find_by(email:"vaishali.pitroda@bacancytechnology.com") 
unless admin.present?  
	admin = User.create(username:"vaishali",email:"vaishali.pitroda@bacancytechnology.com")   
	admin.password =  "123456"      
	admin.save               
end   
admin.add_role "admin"  
puts admin.errors.full_messages
