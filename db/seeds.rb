if User.count.zero?
  User.create(
  {email: "john.doe@example.com", password: "password123", password_confirmation: "password123", full_name: "John Doe", department: 1, staff_id: 1 }
  )
end

# db/seeds.rb
if Staff.count.zero?
  Staff.create([
                 { sn: 1, staff_id: "ST001", firstname: "John", lastname: "Doe", address: "123 Main St, Cityville", email: "john.doe@example.com", phone_no: "555-1234", role: "Manager", salary: 50000.0 },
                 { sn: 2, staff_id: "ST002", firstname: "Jane", lastname: "Smith", address: "456 Oak St, Townsville", email: "jane.smith@example.com", phone_no: "555-5678", role: "Assistant", salary: 40000.0 },
                 { sn: 3, staff_id: "ST003", firstname: "Alice", lastname: "Johnson", address: "789 Pine St, Villagetown", email: "alice.johnson@example.com", phone_no: "555-9876", role: "Developer", salary: 60000.0 },
                 { sn: 4, staff_id: "ST004", firstname: "Bob", lastname: "Williams", address: "101 Maple St, Hamletville", email: "bob.williams@example.com", phone_no: "555-6543", role: "Analyst", salary: 45000.0 },
                 { sn: 5, staff_id: "ST005", firstname: "Charlie", lastname: "Brown", address: "202 Birch St, Forestville", email: "charlie.brown@example.com", phone_no: "555-3210", role: "Designer", salary: 47000.0 },
                 { sn: 6, staff_id: "ST006", firstname: "David", lastname: "Taylor", address: "303 Cedar St, Riverside", email: "david.taylor@example.com", phone_no: "555-4321", role: "Engineer", salary: 55000.0 },
                 { sn: 7, staff_id: "ST007", firstname: "Emily", lastname: "Davis", address: "404 Elm St, Hilltop", email: "emily.davis@example.com", phone_no: "555-8765", role: "HR", salary: 48000.0 },
                 { sn: 8, staff_id: "ST008", firstname: "Frank", lastname: "Miller", address: "505 Spruce St, Valleytown", email: "frank.miller@example.com", phone_no: "555-2345", role: "Consultant", salary: 52000.0 },
                 { sn: 9, staff_id: "ST009", firstname: "Grace", lastname: "Wilson", address: "606 Aspen St, Coastville", email: "grace.wilson@example.com", phone_no: "555-7654", role: "Intern", salary: 30000.0 },
                 { sn: 10, staff_id: "ST010", firstname: "Hannah", lastname: "Moore", address: "707 Redwood St, Mountaintop", email: "hannah.moore@example.com", phone_no: "555-4567", role: "Marketing", salary: 47000.0 },
                 { sn: 11, staff_id: "ST011", firstname: "Ian", lastname: "Anderson", address: "808 Sycamore St, Rivertown", email: "ian.anderson@example.com", phone_no: "555-5670", role: "Finance", salary: 51000.0 },
                 { sn: 12, staff_id: "ST012", firstname: "Jack", lastname: "Thompson", address: "909 Dogwood St, Lakeview", email: "jack.thompson@example.com", phone_no: "555-6789", role: "Operations", salary: 53000.0 },
                 { sn: 13, staff_id: "ST013", firstname: "Kelly", lastname: "White", address: "111 Chestnut St, Plainsville", email: "kelly.white@example.com", phone_no: "555-7890", role: "Supervisor", salary: 49000.0 },
                 { sn: 14, staff_id: "ST014", firstname: "Linda", lastname: "Harris", address: "222 Poplar St, Seaside", email: "linda.harris@example.com", phone_no: "555-8901", role: "Coordinator", salary: 46000.0 },
                 { sn: 15, staff_id: "ST015", firstname: "Mike", lastname: "Clark", address: "333 Willow St, Woodland", email: "mike.clark@example.com", phone_no: "555-9012", role: "Sales", salary: 54000.0 },
                 { sn: 16, staff_id: "ST016", firstname: "Nancy", lastname: "Lewis", address: "444 Alder St, Riverbend", email: "nancy.lewis@example.com", phone_no: "555-0123", role: "Admin", salary: 46000.0 },
                 { sn: 17, staff_id: "ST017", firstname: "Oscar", lastname: "Walker", address: "555 Fir St, Highland", email: "oscar.walker@example.com", phone_no: "555-5432", role: "Support", salary: 42000.0 },
                 { sn: 18, staff_id: "ST018", firstname: "Paul", lastname: "Young", address: "666 Hawthorn St, Lakeside", email: "paul.young@example.com", phone_no: "555-6540", role: "Technician", salary: 49000.0 },
                 { sn: 19, staff_id: "ST019", firstname: "Quincy", lastname: "King", address: "777 Cypress St, Meadows", email: "quincy.king@example.com", phone_no: "555-7650", role: "Architect", salary: 57000.0 },
                 { sn: 20, staff_id: "ST020", firstname: "Rachel", lastname: "Scott", address: "888 Beech St, Cliffside", email: "rachel.scott@example.com", phone_no: "555-8760", role: "Designer", salary: 45000.0 }
               ])
end

if Memo.count.zero?
  staff_ids = Staff.pluck(:id)

  Memo.create([
                { sn: 1, title: "Project Review", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("16/11/2022"), message: "Please review the attached project document.", status: "Pending" },
                { sn: 2, title: "Quarterly Update", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("17/11/2022"), message: "Update required for the quarterly report.", status: "Approved" },
                { sn: 3, title: "Meeting Agenda", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("18/11/2022"), message: "Meeting agenda for the next week.", status: "Rejected" },
                { sn: 4, title: "Client Feedback", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("19/11/2022"), message: "Client feedback on the new design.", status: "Pending" },
                { sn: 5, title: "Performance Review", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("20/11/2022"), message: "Team performance review for October.", status: "Approved" },
                { sn: 6, title: "Budget Finalization", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("21/11/2022"), message: "Please finalize the budget for Q1.", status: "Rejected" },
                { sn: 7, title: "Report Submission", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("22/11/2022"), message: "Reminder: submission deadline for the report is approaching.", status: "Pending" },
                { sn: 8, title: "Software Deployment", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("23/11/2022"), message: "New software deployment on Friday.", status: "Approved" },
                { sn: 9, title: "Design Coordination", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("24/11/2022"), message: "Please coordinate with the design team.", status: "Pending" },
                { sn: 10, title: "Team Update", sent_from_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("25/11/2022"), message: "Weekly team update required.", status: "Rejected" }
              ])
end

if StockItem.count.zero?
  StockItem.create([
                     { sn: 1, product_name: "Laptop", product_id: "PROD001", category: "Electronics", price: 1200.0, quantity: 10, total_amount: 1200.0 * 10, supplier: "Tech Supplier Co.", status: 0 }, # In Stock
                     { sn: 2, product_name: "Headphones", product_id: "PROD002", category: "Electronics", price: 150.0, quantity: 20, total_amount: 150.0 * 20, supplier: "Audio World", status: 0 }, # In Stock
                     { sn: 3, product_name: "Office Chair", product_id: "PROD003", category: "Furniture", price: 200.0, quantity: 5, total_amount: 200.0 * 5, supplier: "Furniture Mart", status: 0 }, # In Stock
                     { sn: 4, product_name: "Monitor", product_id: "PROD004", category: "Electronics", price: 300.0, quantity: 8, total_amount: 300.0 * 8, supplier: "Screen World", status: 2 }, # Low in Stock
                     { sn: 5, product_name: "Desk Lamp", product_id: "PROD005", category: "Furniture", price: 50.0, quantity: 0, total_amount: 50.0 * 0, supplier: "Light Suppliers", status: 1 }, # Out of Stock
                     { sn: 6, product_name: "Notebook", product_id: "PROD006", category: "Stationery", price: 5.0, quantity: 100, total_amount: 5.0 * 100, supplier: "Stationery World", status: 0 }, # In Stock
                     { sn: 7, product_name: "Pen", product_id: "PROD007", category: "Stationery", price: 1.0, quantity: 500, total_amount: 1.0 * 500, supplier: "Stationery World", status: 0 }, # In Stock
                     { sn: 8, product_name: "Water Bottle", product_id: "PROD008", category: "Kitchen", price: 10.0, quantity: 30, total_amount: 10.0 * 30, supplier: "Hydro Supplies", status: 2 }, # Low in Stock
                     { sn: 9, product_name: "Desk", product_id: "PROD009", category: "Furniture", price: 350.0, quantity: 3, total_amount: 350.0 * 3, supplier: "Furniture Mart", status: 2 }, # Low in Stock
                     { sn: 10, product_name: "Keyboard", product_id: "PROD010", category: "Electronics", price: 80.0, quantity: 15, total_amount: 80.0 * 15, supplier: "Tech Supplier Co.", status: 0 }, # In Stock
                     { sn: 11, product_name: "Mouse", product_id: "PROD011", category: "Electronics", price: 40.0, quantity: 25, total_amount: 40.0 * 25, supplier: "Tech Supplier Co.", status: 0 }, # In Stock
                     { sn: 12, product_name: "Printer", product_id: "PROD012", category: "Electronics", price: 250.0, quantity: 2, total_amount: 250.0 * 2, supplier: "Office Supplies Co.", status: 2 }, # Low in Stock
                     { sn: 13, product_name: "Water Dispenser", product_id: "PROD013", category: "Kitchen", price: 120.0, quantity: 0, total_amount: 120.0 * 0, supplier: "Hydro Supplies", status: 1 }, # Out of Stock
                     { sn: 14, product_name: "Projector", product_id: "PROD014", category: "Electronics", price: 700.0, quantity: 4, total_amount: 700.0 * 4, supplier: "Tech Supplier Co.", status: 2 }, # Low in Stock
                     { sn: 15, product_name: "Whiteboard", product_id: "PROD015", category: "Stationery", price: 100.0, quantity: 12, total_amount: 100.0 * 12, supplier: "Stationery World", status: 0 } # In Stock
                   ])
end
if ProcurementItem.count.zero?
  staff_ids = Staff.pluck(:id)

  ProcurementItem.create([
                           { sn: 1, itemname: "Office Chairs", price: 75.0, quantity: 10, total_amount: 750.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("01/10/2023"), status: "Pending" },
                           { sn: 2, itemname: "Monitors", price: 150.0, quantity: 8, total_amount: 1200.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("05/10/2023"), status: "Approved" },
                           { sn: 3, itemname: "Keyboards", price: 25.0, quantity: 20, total_amount: 500.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("10/10/2023"), status: "Rejected" },
                           { sn: 4, itemname: "Projectors", price: 300.0, quantity: 2, total_amount: 600.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("12/10/2023"), status: "Pending" },
                           { sn: 5, itemname: "Laptops", price: 800.0, quantity: 5, total_amount: 4000.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("15/10/2023"), status: "Approved" },
                           { sn: 6, itemname: "Printers", price: 250.0, quantity: 4, total_amount: 1000.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("18/10/2023"), status: "Pending" },
                           { sn: 7, itemname: "Scanner", price: 200.0, quantity: 3, total_amount: 600.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("20/10/2023"), status: "Approved" },
                           { sn: 8, itemname: "Conference Table", price: 1200.0, quantity: 1, total_amount: 1200.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("22/10/2023"), status: "Rejected" },
                           { sn: 9, itemname: "External Hard Drives", price: 100.0, quantity: 10, total_amount: 1000.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("25/10/2023"), status: "Pending" },
                           { sn: 10, itemname: "Software Licenses", price: 500.0, quantity: 3, total_amount: 1500.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("27/10/2023"), status: "Approved" },
                           { sn: 11, itemname: "Desk Lamps", price: 20.0, quantity: 15, total_amount: 300.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("30/10/2023"), status: "Pending" },
                           { sn: 12, itemname: "Paper Shredders", price: 100.0, quantity: 5, total_amount: 500.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("01/11/2023"), status: "Rejected" },
                           { sn: 13, itemname: "Coffee Machines", price: 150.0, quantity: 2, total_amount: 300.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("03/11/2023"), status: "Pending" },
                           { sn: 14, itemname: "Server Units", price: 2500.0, quantity: 2, total_amount: 5000.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("05/11/2023"), status: "Approved" },
                           { sn: 15, itemname: "Whiteboards", price: 150.0, quantity: 4, total_amount: 600.0, requested_by_id: staff_ids.sample, sent_to_id: staff_ids.sample, date: Date.parse("07/11/2023"), status: "Pending" }
                         ])
end
